const mongoose = require("mongoose");

const User = require("../models/user");

const getUserForRecommendation = async (id) => {
    try {
        const users = await User.findById(id);
        const newData = users.map((user) => {
            const { _id:id, avatar,name,age,profession,bio  } = user;
            return { id, avatar,name,age,profession, bio  };
          });
          return {
            success: true,
            message: "User Recommendations",
            data: newData,
          };
    } catch (error) {
        return { 
            success:false,
            message: error.message,
            data:null
        };
    }
}


module.exports = {getUserForRecommendation};