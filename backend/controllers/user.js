const User = require("../models/user");
const Hackathon = require("../models/hackathon");
const turf = require("@turf/turf");

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

const updateLocation = async (id, data) => {
  try {
    const { latitude, longitude } = data;
    const user = await User.findByIdAndUpdate(
      id,
      { location: { type: "Point", coordinates: [longitude, latitude] } },
      { new: true }
    );
    if (!user) return { message: "User not found" };
    const hackathon=await findHackathon(id,latitude,longitude);
    return hackathon;
  } catch (error) {
    return error;
  }
};

const findHackathon = async (id, lat, long) => {
  try {
    const maxDistance = 50;
    console.log("i was here");
    const hackathons = await Hackathon.find({});
    const result = hackathons.map((hackathon) => {
      const { location } = hackathon;
      const distance = turf.distance(
        turf.point([lat, long]),
        turf.point(location.coordinates),
        { units: "meters" }
      );
      hackathon.distance=distance;
      return hackathon;
    });
    result.sort((a, b) => a.distance - b.distance);
    if(result.length === 0) return {message: "No hackathon found"};
    //check if the user is already a participant
    const hackathon = result[0];
    const isParticipant = hackathon.participants.includes(id);
    if(!isParticipant){
      if(hackathon.distance <= maxDistance){
        hackathon.participants.push(id);
        await hackathon.save();
      }
    } 
    else{
      if(hackathon.distance > maxDistance){
        const index = hackathon.participants.indexOf(id);
        hackathon.participants.splice(index, 1);
        await hackathon.save();
      }
      else{
        return {message: "User already a participant and in the hackathon"};
      }
    }
    return result;
  } catch (error) {
    return error;
  }
};
module.exports = {
  signup,
  // signupFirebase,
  getUser,
  updateUser,
  getAllUsers,
  updateLocation,
  sendRequest,
};
