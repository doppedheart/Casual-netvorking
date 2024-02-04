const mongoose = require("mongoose");

const notificationSchema = new mongoose.Schema({
  sender: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
  reciever: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
  message: {
    type: String,
  },
  name: {
    type: String,
  },
  avatar: {
    type: String,
  },
  status: {
    type: String,
    enum: ["pending", "accepted", "rejected"],
    default: "pending",
  },
});

const NotificationModel = mongoose.model("Notification", notificationSchema);

//NotificationModel.createIndexes({ location: "2dsphere"});

module.exports = NotificationModel;
