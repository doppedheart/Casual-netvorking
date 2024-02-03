const mongoose = require("mongoose");

const commentSchema = new mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    content: { type: String, required: true },
    likes: { type: Number, default: 0 },
    views: { type: Number, default: 0 },
  },
  {
    timestamps: true,
  }
);

const CommentModel = mongoose.model("Comment", commentSchema);

module.exports = CommentModel;
