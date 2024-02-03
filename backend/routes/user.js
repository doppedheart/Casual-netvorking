const router = require("express").Router();
const { upload } = require("../middleware");
const {
  signup,
  signupFirebase,
  getUser,
  updateUser,
  getAllUsers,
  updateLocation,
  sendRequest,
  recommendations,
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
// router.post("/signup/firebase", async (req, res) => {
//   const response = await signupFirebase(req.body.uid);
//   res.send(response);
// });
router.post("/:id", async (req, res) => {
  const response = await updateUser(req.params.id, req.body);
  res.send(response);
});
router.put("/updateLocation/:id", async (req, res) => {
  const response = await updateLocation(req.params.id, req.body);
  res.send(response);
});

router.get("/:id/recommendations", async (req, res) => {
  const response = await recommendations(req.params.id);
  res.send(response);
});

router.post("/:id/sendRequest", async (req, res) => {
  const senderId = req.body.senderId;
  const recieverId = req.body.recieverId;
  const deviceToken = req.body.deviceToken;
  const message = req.body.message;
  const response = await sendRequest(
    senderId,
    recieverId,
    deviceToken,
    message
  );
  res.send(response);
});

module.exports = router;
