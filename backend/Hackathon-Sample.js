const sampleData = [
  {
    name: "Diversion 2k24",
    description: "Diversion 2k24 is a unique event that utilizes AI in its execution processes, including the creation of all artwork and posters. This distinct feature sets it apart from other hackathons. The event also involves aspects of Augmented Reality and Cloud Computing. Participants of Diversion 2k24 can look forward to exciting prizes, swag kits, and networking opportunities. The event will also feature multiple partners and communities. Companies will provide problem statements as tracks where participants can compete to offer solutions and win awards.",
    startDate: new Date("2024-02-03"), // Ongoing start date
    endDate: new Date("2024-02-04"), // Ongoing end date
    organizer: "MLH: Major League Hacking",
    location: {
      type:"Point",
      coordinates:[22.572651923268783, 88.43739161717922]
    },
    registrationLink: "https://diversion.tech/",
    participants: [],
    channels: {
      general: "GeneralChannelDataQuest",
      announcements: "AnnouncementsChannelDataQuest",
      discussions: "DiscussionsChannelDataQuest",
      collaboration: "CollaborationChannelDataQuest",
    },
    sponsors: ["MongoDB ", "CloudFlare","Flow","GoDaddy"],
    judges: ["Nathan Johnson", "Emma White"],
    prizes: ["Data Explorer Trophy", "Apple iPad Air"],
  },
  { 
    name: "DataQuest Challenge",
    description: "Explore the world of data science!",
    startDate: new Date("2024-02-01"), // Ongoing start date
    endDate: new Date("2024-02-28"), // Ongoing end date
    organizer: "DataPioneers",
    location: {
      type:"Point",
      coordinates:[22.572651923268783, 88.43739161717922]
    },  
    registrationLink: "https://dataquestchallenge2024.example/register",
    participants: [], // Populate with User IDs
    channels: {
      general: "GeneralChannelDataQuest",
      announcements: "AnnouncementsChannelDataQuest",
      discussions: "DiscussionsChannelDataQuest",
      collaboration: "CollaborationChannelDataQuest",
    },
    sponsors: ["DataInnovate", "TechInsights"],
    judges: ["Nathan Johnson", "Emma White"],
    prizes: ["Data Explorer Trophy", "Apple iPad Air"],
  },
  {
    name: "CodeStorm Live",
    description: "Code your way through the challenges!",
    startDate: new Date("2024-01-15"), // Ongoing start date
    endDate: new Date("2024-03-15"), // Ongoing end date
    organizer: "CodeStorm Community",
    location: {
      type:"Point",
      coordinates:[23.572651923268783, 89.43739161717922]
    },
    registrationLink: "https://codestormlive2024.example/register",
    participants: [], // Populate with User IDs
    channels: {
      general: "GeneralChannelCodeStorm",
      announcements: "AnnouncementsChannelCodeStorm",
      discussions: "DiscussionsChannelCodeStorm",
      collaboration: "CollaborationChannelCodeStorm",
    },
    sponsors: ["CodeForge", "DevGenius"],
    judges: ["Lily Anderson", "Samuel Carter"],
    prizes: ["Coding Maverick Trophy", "Sony WH-1000XM4 Headphones"],
  },
  {
    name: "CodeFest 2024",
    description: "An annual coding competition",
    startDate: new Date("2024-03-01"),
    endDate: new Date("2024-03-03"),
    organizer: "Tech Society",
    location: {
      type:"Point",
      coordinates:[24.572651923268783, 85.43739161717922]
    },
    registrationLink: "https://codefest2024.example/register",
    participants: [], // You can populate this with User IDs later
    channels: {
      general: "GeneralChannelCodeFest",
      announcements: "AnnouncementsChannelCodeFest",
      discussions: "DiscussionsChannelCodeFest",
      collaboration: "CollaborationChannelCodeFest",
    },
    sponsors: ["TechCorp", "DevWorld"],
    judges: ["John Doe", "Jane Smith"],
    prizes: ["First Place Trophy", "Amazon Gift Card"],
  },
  {
    name: "CodeFusion Hackathon",
    description: "Merge ideas, write code, innovate!",
    startDate: new Date("2024-06-01"),
    endDate: new Date("2024-06-03"),
    organizer: "CodeFusion Organization",
    location: {
      type:"Point",
      coordinates:[21.572651923268783, 90.43739161717922]
    },
    registrationLink: "https://codefusionhackathon2024.example/register",
    participants: [], // Populate with User IDs
    channels: {
      general: "GeneralChannelCodeFusion",
      announcements: "AnnouncementsChannelCodeFusion",
      discussions: "DiscussionsChannelCodeFusion",
      collaboration: "CollaborationChannelCodeFusion",
    },
    sponsors: ["TechInnovate", "CodeHub"],
    judges: ["Michael Johnson", "Sophia Smith"],
    prizes: ["Innovator Trophy", "Dell XPS Laptop"],
  },
  {
    name: "DataDriven Challenge",
    description: "Harness the power of data!",
    startDate: new Date("2024-07-15"),
    endDate: new Date("2024-07-17"),
    organizer: "DataGeeks Society",
    location: {
      type:"Point",
      coordinates:[21.572651923268783, 88.43739161717922]
    },   
    registrationLink: "https://datadrivenchallenge2024.example/register",
    participants: [], // Populate with User IDs
    channels: {
      general: "GeneralChannelDataDriven",
      announcements: "AnnouncementsChannelDataDriven",
      discussions: "DiscussionsChannelDataDriven",
      collaboration: "CollaborationChannelDataDriven",
    },
    sponsors: ["DataSolutions", "AnalyticsCorp"],
    judges: ["David Miller", "Emma White"],
    prizes: ["Data Pioneer Trophy", "Amazon Echo Show"],
  },
  {
    name: "HackXperience",
    description: "Innovate, Collaborate, Create",
    startDate: new Date("2024-04-15"),
    endDate: new Date("2024-04-17"),
    organizer: "InnovateTech",
    location: {
      type:"Point",
      coordinates:[25.572651923268783, 88.43739161717922]
    },    
    registrationLink: "https://hackxperience2024.example/register",
    participants: [], // Populate with User IDs
    channels: {
      general: "GeneralChannelHackXperience",
      announcements: "AnnouncementsChannelHackXperience",
      discussions: "DiscussionsChannelHackXperience",
      collaboration: "CollaborationChannelHackXperience",
    },
    sponsors: ["InnoSolutions", "TechHub"],
    judges: ["Alice Johnson", "Bob Anderson"],
    prizes: ["Innovation Trophy", "Google Pixel 6"],
  },
  {
    name: "CodeBlitz 2024",
    description: "Fast-paced coding challenge",
    startDate: new Date("2024-05-10"),
    endDate: new Date("2024-05-12"),
    organizer: "CodeMasters",
    location: {
      type:"Point",
      coordinates:[22.572651923268783, 78.43739161717922]
    },
    registrationLink: "https://codeblitz2024.example/register",
    participants: [], // Populate with User IDs
    channels: {
      general: "GeneralChannelCodeBlitz",
      announcements: "AnnouncementsChannelCodeBlitz",
      discussions: "DiscussionsChannelCodeBlitz",
      collaboration: "CollaborationChannelCodeBlitz",
    },
    sponsors: ["CodeForge", "DevGenius"],
    judges: ["Eva Williams", "Charlie Lee"],
    prizes: ["Coding Champion Trophy", "Apple Watch Series 7"],
  },
];

module.exports = { sampleData };
