const mongoose = require("mongoose");

const hackathonSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    description: { type: String },
    startDate: { type: Date, required: true },
    endDate: { type: Date, required: true },
    organizer: { type: String },
    location: { type: String },
    registrationLink: { type: String },
    participants: {
      type: [mongoose.Schema.Types.ObjectId],
      ref: "User",
    },

    channels: {
      general: { type: String },
      announcements: { type: String },
      discussions: { type: String },
      collaboration: { type: String },
    },
    sponsors: { type: [String] },
    judges: { type: [String] },
    prizes: { type: [String] },
  },
  {
    timestamps: true,
  }
);

const HackathonModel = mongoose.model("Hackathon", hackathonSchema);

module.exports = HackathonModel;
