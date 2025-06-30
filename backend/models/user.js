// models/User.js

const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },

  email: { type: String, required: true, unique: true },
  passwordHash: { type: String, required: true },

  role: {
    type: String,
    enum: ['moderate_admin', 'ceo', 'regional_manager', 'agent'],
    required: true,
  },

  permissions: [String], // optional: like ['create-user', 'view-client']

  area: String, // optional: for agents or regional managers (e.g., "Jaffna")

  createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }, // if created by another admin

  createdAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model("User", userSchema);
