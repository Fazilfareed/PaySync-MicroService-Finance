const mongoose = require("mongoose");

const regionSchema = new mongoose.Schema({
  code: { type: String, required: true, unique: true }, // e.g., R01
  name: { type: String, required: true },               // e.g., "Western"
  districts: [{ type: String, required: true }]
}, {
  timestamps: true
});

module.exports = mongoose.model("Region", regionSchema);
