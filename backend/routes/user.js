const router = require("express").Router();
const { upload } = require("../middleware");
const {
  signup,
  getUser,
  updateUser,
  updateImage,
  getAllUsers,
  updateLocation,
  sendRequest,
  acceptRequest,
  rejectRequest,
  getNotifications,
  recommendations,
  fcmStore,
} = require("../controllers/user");
const fs = require("fs");
router.get("/", async (req, res) => {
  const response = await getAllUsers();
  res.send(response);
});
router.get("/profile/:id", async (req, res) => {
  const id = req.params.id;
  const response = await getUser(id);
  res.send(response);
});
router.post("/signup", upload.array("avatar"), async (req, res) => {
  const response = await signup(req.body, req.files);
  if (req.files.length !== 0) fs.unlinkSync(req.files[0].path);
  res.send(response);
});
router.post("/:id", async (req, res) => {
  const response = await updateUser(req.params.id, req.body);
  res.send(response);
});
router.post("/:id/image", upload.array("avatar"), async (req, res) => {
  const response = await updateImage(req.params.id, req.files[0]);
  if (req.files.length !== 0) fs.unlinkSync(req.files[0].path);
  res.send(response);
});
router.post("/updateLocation/:id", async (req, res) => {
  const response = await updateLocation(req.params.id, req.body);
  res.send(response);
});

router.get("/:id/recommendations", async (req, res) => {
  const response = await recommendations(req.params.id, req.query.page);
  res.send(response);
});
router.post("/:id/fcm", async (req, res) => {
  const response = await fcmStore(req.params.id, req.body.fcmToken);
  res.send(response);
});

router.post("/:id/sendRequest", async (req, res) => {
  const senderId = req.params.id;
  const recieverId = req.body.recieverId;
  const isPickUpLine = req.body.isPickUpLine;
  const response = await sendRequest(senderId, recieverId, isPickUpLine);
  res.send(response);
});
router.post("/:id/acceptRequest", async (req, res) => {
  const recieverId = req.params.id;
  const notificationId = req.body.notificationId;
  const response = await acceptRequest(notificationId, recieverId);
  res.send(response);
});

router.post("/:id/rejectRequest", async (req, res) => {
  const notificationId = req.body.notificationId;
  const response = await rejectRequest(notificationId);
  res.send(response);
});
router.get("/:id/notifications", async (req, res) => {
  const response = await getNotifications(req.params.id);
  res.send(response);
});

module.exports = router;
