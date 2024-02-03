const User = require("../models/user");
const Hackathon = require("../models/hackathon");
const turf = require("@turf/turf");

const { uploadToS3 } = require("../middleware");
const signup = async (data, images) => {
  try {
    const { username, email } = data;
    let avatar = { url: "" };
    const userExists = await User.findOne({ $or: [{ username }, { email }] });
    if (userExists)
      return { message: "User with this email or username already exists" };
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
    const user = new User({ avatar: avatar.url, ...data });
    await user.save();
    return user;
  } catch (error) {
    return error;
  }
};
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

const updateLocation = async (id, data) => {
  try {
    const { latitude, longitude } = data;
    const user = await User.findByIdAndUpdate(
      id,
      {location: { type: 'Point', coordinates: [longitude, latitude] }},
      { new: true }
    );
    if (!user) return { message: "User not found" };
    const hackathon=findHackathon(id,latitude,longitude);
    return hackathon;
  } catch (error) {
    return error;
  }
};

const findHackathon = async (id,lat, long) => {
  try {
    const  maxDistance = 50;
    console.log("i was here");
    const hackathons = await Hackathon.find({});
    const result =  hackathons.map((hackathon)=>{
      const { location } = hackathon;
      const distance = turf.distance(
        turf.point([lat, long]),
        turf.point(location.coordinates),
        {units:'meters'}
      );
      hackathon.distance=distance;
      console.log(distance);
      return hackathon;
    });
    result.sort((a, b) => a.distance - b.distance);
    console.log(result);
    await result.save();
    if(result.length === 0) return {message: "No hackathon found"};
    //check if the user is already a participant
    const hackathon= result[0];
    const isParticipant = hackathon.participants.includes(id);
    if(isParticipant){
      
      return {message: "User already a participant"};
    } 
    if(hackathon.distance <= maxDistance){
      hackathon.participants.push(id);
      await hackathon.save();
    }
    else{
      //remove participant
      if(isParticipant){
        const index = hackathon.participants.indexOf(id);
        hackathon.participants.splice(index,1);
        await hackathon.save();
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
  getAllUsers,
  updateLocation,
};
