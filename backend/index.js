// index.js
const express = require("express");
const dotenv = require("dotenv");
const connectDB = require("./config/db");

const User = require("./models/User");
const bcrypt = require("bcrypt");

dotenv.config();
connectDB();

const app = express();
app.use(express.json());

app.get("/add-admin", async (req, res) => {
  try {
    const passwordHash = await bcrypt.hash("Admin@123", 10);
    const user = await User.create({
      name: "Main Admin",
      email: "admin@example.com",
      passwordHash,
      role: "moderate_admin",
      permissions: ["create-user", "approve-client"],
    });
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(process.env.PORT || 5000, () => {
  console.log("✅ Server running");
});
