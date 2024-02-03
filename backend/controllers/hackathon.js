// create read update and delete hackathon details option for admin
// 4 different function
const { sampleData } = require("../../Hackathon-Sample");
const Hackathon = require("../models/hackathon");

const createHackathon = async (req, res) => {
  try {
    const hackathon = new Hackathon(req.body);
    await hackathon.save();
    res.status(201).json(hackathon);
  } catch (error) {
    res.status(409).json({ message: error.message });
  }
};

const getHackathons = async (req, res) => {
  try {
    const hackathons = await Hackathon.find();
    res.status(200).json(hackathons);
  } catch (error) {
    res.status(404).json({ message: error.message });
  }
};

// get all the ongoing hackathons
const getOngoingHackathons = async (req, res) => {
  try {
    const hackathons = await Hackathon.find({
      startDate: { $lt: new Date() },
      endDate: { $gt: new Date() },
    });
    res.status(200).json(hackathons);
  } catch (error) {
    res.status(404).json({ message: error.message });
  }
};

const getUpcomingHackathons = async (req, res) => {
  try {
    const hackathons = await Hackathon.find({ startDate: { $gt: new Date() } });
    res.status(200).json(hackathons);
  } catch (error) {
    res.status(404).json({ message: error.message });
  }
};

const getHackathon = async (req, res) => {
  try {
    const hackathon = await Hackathon.findById(req.params.id).populate(
      "participants"
    );
    res.status(200).json(hackathon);
  } catch (error) {
    res.status(404).json({ message: error.message });
  }
};

const insertManyHackathon = async (req, res) => {
  try {
    const hackathons = await Hackathon.insertMany(sampleData);
    res.status(201).json(hackathons);
  } catch (error) {
    res.status(409).json({ message: error.message });
  }
};

module.exports = {
  createHackathon,
  getHackathons,
  getOngoingHackathons,
  getUpcomingHackathons,
  getHackathon,
  insertManyHackathon,
};
