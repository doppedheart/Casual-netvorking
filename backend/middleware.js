const multer = require("multer");
const path = require("path");
const { S3Client, PutObjectCommand } = require("@aws-sdk/client-s3");
const fs = require("fs");
const client = new S3Client({
  region: "ap-south-1",
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
  },
});

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    const destinationPath = path.resolve(__dirname, "ImageBuffer");
    cb(null, destinationPath);
  },
  filename: (req, file, cb) => {
    cb(null, file.originalname);
  },
});
const upload = multer({ storage });

const getObjectUrl = async (Bucket, Key) => {
  const bucketName = Bucket;
  const s3ObjectUrl = `https://${bucketName}.s3.amazonaws.com/${process.env.S3_BUCKET_FOLDER}/${Key}`;
  return s3ObjectUrl;
};

const uploadToS3 = async (Bucket, Key, path, ContentType) => {
  try {
    const Body = fs.readFileSync(path);
    const command = new PutObjectCommand({
      Bucket,
      Key: process.env.S3_BUCKET_FOLDER + "/" + Key,
      Body,
      ContentType,
    });
    const response = await client.send(command);
    const url = await getObjectUrl(Bucket, Key);
    return { Key, url };
  } catch (error) {
    console.log(error);
    return error;
  }
};

const isLoggedin = (req, res, next) => {
  next();
};

module.exports = { upload, uploadToS3, isLoggedin };
