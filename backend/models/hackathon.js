const mongoose = require("mongoose");

const hackathonSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    description: { type: String },
    startDate: { type: Date, required: true },
    endDate: { type: Date, required: true },
    organizer: { type: String },
    location: {
      type: {
        type: String, 
        enum: ['Point'], 
        default:'Point'
      },
      coordinates: {
        type: [Number],
        required: true
      }
    },
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
    distance: { type: Number },
  },
  {
    timestamps: true,
  }
);

hackathonSchema.index({ location: "2dsphere" });

const HackathonModel = mongoose.model("Hackathon", hackathonSchema);
//HackathonModel.createIndex({ location:"2dsphere"});


module.exports = HackathonModel;
