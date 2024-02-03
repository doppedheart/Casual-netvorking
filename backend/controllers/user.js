const User = require("../models/user");
const { uploadToS3 } = require("../middleware");
const {firebaseAdmin} = require("../middleware")
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
const signupFirebase = async (uid){
    try{
    firebaseAdmin.auth().getUser(uid)
        .then(function(userRecord) {
            // See the UserRecord reference doc for the contents of userRecord
            console.log('Successfully fetched user data:', userRecord.toJSON());
            res.status(200).send(userRecord.toJSON());
        })
        .catch(function(error) {
            console.log('Error fetching user data:', error);
            res.status(500).send('Error fetching user data');
        });
    }
    catch(err){
        console.log(err);
    }

}
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

module.exports = {
  signup,
  signupFirebase,
  getUser,
  updateUser,
  getAllUsers,
};
