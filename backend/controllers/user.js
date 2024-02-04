const User = require("../models/user");
const FCM = require("../models/fcm");
const Notification = require("../models/notification");
const Hackathon = require("../models/hackathon");
const turf = require("@turf/turf");
const mongoose = require("mongoose");
const { uploadToS3 } = require("../middleware");
const { firebaseAdmin } = require("../middleware");
const { name } = require("ejs");
const signup = async (data, images) => {
  try {
    const { username, email } = data;
    let avatar = { url: "" };
    const userExists = await User.findOne({ $or: [{ username }, { email }] });
    if (userExists) {
      let { id, name, avatar } = userExists;
      return {
        success: true,
        message: "User with this email or username already exists",
        data: { id, name, email, avatar, isComplete: true },
      };
    }
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
    } //{id , name , email,avatar}
    const user = new User({ avatar: avatar.url, ...data });
    await user.save();
    const { id, name } = user;
    return {
      success: true,
      message: "User added to Database",
      data: { id, name, email, avatar: avatar.url },
    };
  } catch (error) {
    return { success: false, message: "Internal Server error", data: null };
  }
};
const getAllUsers = async () => {
  try {
    const users = await User.find({});
    return { success: true, message: "All Users", data: users };
  } catch (error) {
    return { success: false, message: "Internal Server error", data: null };
  }
};

const getUser = async (id) => {
  try {
    const user = await User.findById(id);
    if (!user) return { success: false, message: "User not found", data: null };
    return { success: true, message: "User data", data: user };
  } catch (error) {
    console.log(error);
    return { success: false, message: "Internal Server error", data: null };
  }
};
const updateUser = async (id, data) => {
  try {
    const user = await User.findByIdAndUpdate(id, { ...data }, { new: true });
    if (!user) return { success: false, message: "User not found", data: null };
    return {
      success: true,
      message: "User updated successfully",
      data: null,
    };
  } catch (error) {
    return { success: false, message: "Internal Server error", data: null };
  }
};
const updateImage = async (id, images) => {
  try {
    let avatar = { url: "" };
    if (images.length !== 0) {
      console.log(images)
      const image = images.originalname;
      const filename =
        image.split(".")[0] + "_" + Date.now() + "." + image.split(".")[1];
      console.log(filename);
      avatar = await uploadToS3(
        process.env.S3_BUCKET_NAME,
        filename,
        images.path,
        images.mimetype
      );
      console.log(avatar.url);
    }
    const user = await User.findById(id)
    user.gallery.push(avatar.url);
    await user.save();
    return {
      success: true,
      message: "Image successfully updated",
      avatar: avatar.url,
    };
  } catch (error) {
    console.log(error)
    return { success: false, message: "Internal Server error", data: null };
  }
};

const recommendations = async (userId,page) => {
  try {
    const user = await User.findById(userId);
    let size=5;
    if (!user) {
      return { success: false, message: "User not found", data: null };
    }
    const userInterests = user.interests;
    let recommendations = await User.find({
      $or: [
        { "interests.occupation": { $in: userInterests.occupation } },
        {
          "interests.frameworksAndTools": {
            $in: userInterests.frameworksAndTools,
          },
        },
        { "interests.hobbies": { $in: userInterests.hobbies } },
        { "interests.companies": { $in: userInterests.companies } },
      ],
      _id: { $ne: user._id }, // Exclude the current user
    }).limit(size).skip(page*size)
    if(recommendations.length==0){
      const allRecommendations = await User.find().limit(size).skip(page*size);
      if(allRecommendations.length==0){
        return { success: false, message: "No recommendations found", data: null };
      }
      recommendations = allRecommendations.map((recommendation)=> {
        if(recommendation._id != userId){
          return recommendation;
        }
      });
    }
    
    const newData = recommendations.map((user) => {
      const { _id:id, avatar,name,age,profession,bio  } = user;
      return { id, avatar,name,age,profession, bio  };
    });
    return {
      success: true,
      message: "User Recommendations",
      data: newData,
    };
  } catch (err) {
    console.log(err);
    return { success: false, message: "Internal Server error", data: null };
  }
};

const fcmStore = async (userId, fcmToken) => {
  try {
    const fcmExists = await FCM.findOne({ user: userId });
    if (fcmExists) {
      fcmExists.token = fcmToken;
      fcmExists.save();
      return { success: true, message: "fcm token updated", data: null };
    }
    const fcm = new FCM({ user: userId, token: fcmToken });
    fcm.save();
    return { success: true, message: "fcm token added", data: null };
  } catch (err) {
    return { success: false, message: "Internal Server error", data: null };
  }
};

const sendRequest = async (senderId, recieverId, isPickUpLine) => {
  try {
    console.log("sendRequest");
    console.log(senderId, recieverId, isPickUpLine);
    const reciever = await FCM.findOne({ user: recieverId }).populate("user");
    // console.log("reciever  ", reciever);
    const token = reciever.token;
    const sender = await User.findById(senderId);
    // console.log(sender);
    const message = isPickUpLine
      ? sender.conversationStarter.pickupLines[0]
      : sender.conversationStarter.icebreakerResponses[0];

    const payload = {
      notification: {
        title: `Connection Request from ${sender.name}`,
        body: message,
      },
      token,
    };
    firebaseAdmin
      .messaging()
      .send(payload)
      .then((response) => {
        console.log("Successfully sent message:", response);
      })
      .catch((error) => {
        console.log("Error sending message:", error);
        return { success: false, message: "Internal Server Error", data: null };
      });
    const notification = new Notification({
      sender,
      reciever,
      message,
      name: sender.name,
      avatar: sender.avatar,
    });
    await notification.save();
    reciever.user.notifications.push(notification._id);
    // console.log(reciever);
    await reciever.user.save();
    return { success: true, message: "connection request send", data: null };
  } catch (error) {
    console.log("Error sending message:", error);
    return { success: false, message: "Internal Server Error", data: null };
  }
};

const acceptRequest = async (notificationId) => {
  try {
    const notification = await Notification.findById(notificationId);
    if (!notification)
      return { success: false, message: "Bad request", data: null };
    const senderId = notification.senderId;
    const recieverId = notification.recieverId;
    await Notification.findByIdAndDelete(notificationId);
    const sender = await User.findByIdAndUpdate(
      recieverId,
      { $pull: { notifications: notificationId } },
      { new: true }
    );
    const senderToken = FCM.find({ user: senderId });
    const reciever = await User.findById(recieverId);
    sender.connections.push(recieverId);
    reciever.connections.push(senderId);
    await sender.save();
    await reciever.save();
    const payload = {
      notification: {
        title: `Connection accepted from ${sender.name}`,
      },
      senderToken,
    };
    firebaseAdmin
      .messaging()
      .send(payload)
      .then((response) => {
        console.log("Successfully sent message:", response);
        return { success: true, message: "connection accepted", data: null };
      });
  } catch (error) {
    return { success: false, message: "Internal Server Error", data: null };
  }
};
const rejectRequest = async (notificationId) => {
  try {
    const notification = await Notification.findById(notificationId);
    if (!notification)
      return { success: false, message: "Bad request", data: null };
    const recieverId = notification.reciever;
    const reciever = await User.findById(recieverId);
    console.log(reciever);

    await Notification.findByIdAndDelete(notificationId);
    sender.notifications.pull(notificationId);
    await sender.save();
    console.log("sender", sender);
    return { success: true, message: "Connection successfully rejected" };
  } catch (error) {
    console.log(error);
    return { success: false, message: "Internal Server Error", data: null };
  }
};

const getNotifications = async (id) => {
  try {
    const user = await User.findById(id).populate("notifications");
    const data = user.notifications;
    return { success: true, message: "User notifications", data };
  } catch (error) {
    console.log(error);
    return { success: false, message: "Internal Server Error", data: null };
  }
};

const connections = async (id) => {
  try {
    const user = await User.findById(id).populate("connections");
    const connections = user.connections;
    connections.map((connection) => {
      return {
        _id: connection._id,
        name: connection.name,
        avatar: connection.avatar,
      };
    });
    return connections;
  } catch (error) {
    console.log(error);
    return { success: false, message: "Internal Server Error", data: null };
  }
};

const updateLocation = async (id, data) => {
  try {
    const { latitude, longitude } = data;
    const user = await User.findByIdAndUpdate(
      id,
      { location: { type: "Point", coordinates: [longitude, latitude] } },
      { new: true }
    );
    if (!user) return { message: "User not found" };
    const hackathon = await findHackathon(id, latitude, longitude);
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
      hackathon.distance = distance;
      return hackathon;
    });
    result.sort((a, b) => a.distance - b.distance);
    if (result.length === 0) return { message: "No hackathon found" };
    //check if the user is already a participant
    const hackathon = result[0];
    const isParticipant = hackathon.participants.includes(id);
    if (!isParticipant) {
      if (hackathon.distance <= maxDistance) {
        hackathon.participants.push(id);
        await hackathon.save();
      }
    } else {
      if (hackathon.distance > maxDistance) {
        const index = hackathon.participants.indexOf(id);
        hackathon.participants.splice(index, 1);
        await hackathon.save();
      } else {
        return { message: "User already a participant and in the hackathon" };
      }
    }
    return result;
  } catch (error) {
    return error;
  }
};
module.exports = {
  signup,
  getUser,
  updateUser,
  updateImage,
  getAllUsers,
  updateLocation,
  sendRequest,
  rejectRequest,
  recommendations,
  fcmStore,
};
