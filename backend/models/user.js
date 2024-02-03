const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  age: { type: Number },
  gender: { type: String },
  username: { type: String, unique: true },
  bio: { type: String },
  avatar: { type: String },
  timeSpent: { type: Number },
  profession: { type: String },
  techStack: { type: String },
  eventParticipated: { type: [String] },
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
      enum: ["collaboration", "casual_networking","friendship", "mentorship", "romantic_relationship",  "professional_relationship", "other"],
      default: "casual_networking"
    },

    matchingCriteria: {
      similarTechInterests: { type: Boolean },
      complementarySkills: { type: Boolean },
    },
  },
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
    }
}, 
{
  timestamps: true,
});

userSchema.index({ location: '2dsphere' });

const UserModel = mongoose.model("User", userSchema);

//UserModel.createIndexes({ location: "2dsphere"});

module.exports = UserModel;
