// index.js
const express = require("express");
const dotenv = require("dotenv");
const connectDB = require("./db");

// Load env vars
dotenv.config();

// Initialize app
const app = express();
app.use(express.json());

// Connect to MongoDB
connectDB();

// Routes
app.get("/", (req, res) => {
  res.send("🎉 Backend is running and connected to MongoDB");
});

// Optional: Test DB insert
const User = require("./models/user");
app.get("/add-user", async (req, res) => {
  try {
    const user = await User.create({
      name: "Fazil",
      email: "fazil@example.com",
    });
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`🚀 Server is running on port ${PORT}`);
});
