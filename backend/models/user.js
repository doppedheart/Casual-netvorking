const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  email: { type: String, required: true, unique: true },
  username: { type: String, unique: true },
  name: { type: String, required: true },
  avatar: { type: String },
  bio: { type: String },
  timeSpent: { type: Number },
  age: { type: Number },
  gender: { type: String },
  occupation: { type: String },
  years_of_experience: { type: Number },
  techStack: { type: String },
  hobbies: { type: String },
  eventParticipation: { type: [String] },
  connections: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
  techPreferences: {
    programmingLanguages: { type: [String] },
    frameworksAndTools: { type: [String] },
    techInterests: { type: [String] },
  },

  funQuestions: {
    icebreakerResponses: { type: [String] },
    pickupLines: { type: [String] },
  },

  /*gamingAndChallenges: {
    highScores: {
      quiz: { score: { type: Number }, timestamp: { type: String } },
    },
    challengeParticipation: { type: [String] },
  },*/

  matchingPreferences: {
    connectionTypes: { type: [String] },
    matchingCriteria: {
      similarTechInterests: { type: Boolean },
      complementarySkills: { type: Boolean },
    },
  },
});

const UserModel = mongoose.model("User", userSchema);

module.exports = UserModel;
