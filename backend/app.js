require("dotenv").config();
const app = require("express")();
const mongoose = require("mongoose");
const cors = require("cors");
const bodyParser = require("body-parser");
const userRouter = require("./routes/user");
// const hackRouter = require("./routes/hackathon");

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());
mongoose
  .connect(process.env.MONGODB_DBURL)
  .then(() => {
    console.log("connected to mongodb");
  })
  .catch((err) => {
    console.log(err);
  });
app.get("/", (req, res) => {
  res.send("Welcome");
});
app.use("/user", userRouter);
// app.use("/hackathon", hackRouter);
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is listening at port:${PORT}`);
});
