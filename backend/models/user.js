const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    age: { type: Number },
    gender: { type: String },
    username: { type: String, unique: true },
    bio: { type: String },
    avatar: {
      type: String,
      default:
        "https://yash-s3-bucket-sdk-test.s3.ap-south-1.amazonaws.com/hackconnect/userProfile.png",
    },
    timeSpent: { type: Number },
    profession: { type: String },
    techStack: { type: String },
    eventParticipated: { type: [String] },
    notifications: {
      type: [mongoose.Schema.Types.ObjectId],
      ref: "Notification",
    },
    connections: {
      type: [mongoose.Schema.Types.ObjectId],
      ref: "User",
    },
    interests: {
      occupation: { type: [String] },
      frameworksAndTools: { type: [String] },
      hobbies: { type: [String] },
      companies: { type: [String] },
    },
    conversationStarter: {
      icebreakerResponses: { type: [String] },
      pickupLines: { type: [String] },
    },
    socialLinks: {
      linkedIn: { type: String },
      github: { type: String },
      portfolio: { type: String },
      other: { type: String },
    },
    /*gamingAndChallenges: {
    highScores: {
      quiz: { score: { type: Number }, timestamp: { type: String } },
    },
    challengeParticipation: { type: [String] },
  },*/

    matchingPreferences: {
      connectionType: {
        type: [String],
        enum: [
          "collaboration",
          "casual_networking",
          "friendship",
          "mentorship",
          "romantic_relationship",
          "professional_relationship",
          "other",
        ],
        default: "casual_networking",
      },

      matchingCriteria: {
        similarTechInterests: { type: Boolean },
        complementarySkills: { type: Boolean },
      },
    },
    location: {
      latitude: { type: Number },
      longitude: { type: Number },
    },
    gallery:{
      type:[String]
    }
  },
  {
    timestamps: true,
  }
);

const UserModel = mongoose.model("User", userSchema);

//UserModel.createIndexes({ location: "2dsphere"});

module.exports = UserModel;
