const router = require("express").Router();
const { upload } = require("../middleware");
const {
  signup,
  getUser,
  updateUser,
  getAllUsers,
} = require("../controllers/user");
const fs = require("fs");
router.get("/", async (req, res) => {
  const response = await getAllUsers();
  res.send(response);
});
router.get("/profile/:id", async (req, res) => {
  const id = req.params.id;
  const response = await getUser({ id });
  res.send(response);
});
router.post("/signup", upload.array("images"), async (req, res) => {
  const response = await signup(req.body, req.files);
  if (req.files.length !== 0) fs.unlinkSync(req.files[0].path);
  res.send(response);
});
router.post("/:id", async (req, res) => {
  const response = await updateUser(req.params.id, req.body);
  res.send(response);
});

module.exports = router;