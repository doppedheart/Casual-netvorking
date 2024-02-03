const express = require("express");
const router = express.Router();
const {
  createHackathon,
  getHackathons,
  getOngoingHackathons,
  getUpcomingHackathons,
  getHackathon,
  insertManyHackathon,
} = require("../controllers/hackathon");

router.get("/:id", getHackathon);
router.post("/", createHackathon);

//working
router.get("/", getHackathons);
router.get("/ongoing", getOngoingHackathons);
router.get("/upcoming", getUpcomingHackathons);
router.post("/insert", insertManyHackathon);

module.exports = router;
