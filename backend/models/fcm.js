const mongoose = require("mongoose");

const fcmSchema = new mongoose.Schema({
  token: { type: String },
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
});

const FCMMODEL = mongoose.model("FCM", fcmSchema);

module.exports = FCMMODEL;
