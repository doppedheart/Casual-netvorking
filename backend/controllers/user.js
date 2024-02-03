const User = require("../models/user");
const { uploadToS3 } = require("../middleware");
const { firebaseAdmin } = require("../middleware");
const signup = async (data, images) => {
  try {
    const { username, email } = data;
    let avatar = { url: "" };
    const userExists = await User.findOne({ $or: [{ username }, { email }] });
    if (userExists)
      return { message: "User with this email or username already exists" };
    if (data.avatar) {
      avatar.url = data.avatar;
    } else {
      if (images.length !== 0) {
        const image = images[0].originalname;
        const filename =
          image.split(".")[0] + "_" + Date.now() + "." + image.split(".")[1];
        avatar = await uploadToS3(
          process.env.S3_BUCKET_NAME,
          filename,
          images[0].path,
          images[0].mimetype
        );
        console.log(avatar.url);
      }
    }
    const user = new User({ avatar: avatar.url, ...data });
    await user.save();
    return user;
  } catch (error) {
    return error;
  }
};
// const signupFirebase = async (uid) => {
//   try {
//     firebaseAdmin
//       .auth()
//       .getUser(uid)
//       .then(function (userRecord) {
//         console.log("Successfully fetched user data:", userRecord.toJSON());
//         return { message: "User added to Database" };
//       })
//       .catch(function (error) {
//         console.log("Error fetching user data:", error);
//         return "Error fetching user data";
//       });
//   } catch (err) {
//     console.log(err);
//   }
// };
const getAllUsers = async () => {
  try {
    const users = await User.find({});
    return users;
  } catch (error) {
    return error;
  }
};

const getUser = async (id) => {
  try {
    const user = await User.findOne({
      $and: [{ _id: id }],
    });
    if (!user) return { message: "User not found" };
    return user;
  } catch (error) {
    return error;
  }
};
const updateUser = async (id, data) => {
  try {
    const user = await User.findByIdAndUpdate(id, { ...data }, { new: true });
    if (!user) return { message: "User not found" };
    return user;
  } catch (error) {
    return error;
  }
};

const recommendations = async (userId) => {
  try {
    const user = await User.findById(userId);
    if (!user) {
      return { message: "User not found" };
    }
    const recommendations = await User.find({
      "interests.occupation": { $in: userInterests.occupation },
      "interests.frameworksAndTools": { $in: userInterests.frameworksAndTools },
      "interests.hobbies": { $in: userInterests.hobbies },
      "interests.companies": { $in: userInterests.companies },
      _id: { $ne: user._id }, // Exclude the current user
    });
    return recommendations;
  } catch (err) {
    console.log(err);
    return { message: "Error occured" };
  }
};

const sendRequest = async () => {
  console.log("sendRequest");
  const sendNotification = async (uid, deviceToken, message) => {
    const user = User.findById(uid);
    const name = user.username || user.email;
    const payload = {
      notification: {
        title: "Connection Request",
        subtitle: `from ${name}`,
        body: message,
      },
      token: deviceToken,
    };
  };
  return { message: "connection request send" };
};

const acceptRequest = async () => {};

module.exports = {
  signup,
  //   signupFirebase,
  getUser,
  updateUser,
  getAllUsers,
  sendRequest,
};
