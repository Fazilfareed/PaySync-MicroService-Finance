const mongoose = require("mongoose");

const staffDetailsSchema = new mongoose.Schema({
  staffId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Staff",
    required: true,
    unique: true
  },

  profilePicUrl: {
    type: String
  },

  dateOfBirth: {
    type: Date
  },

  contactNumber: {
    type: String
  },

  address: {
    type: String
  },

  nicNumber: {
    type: String
  },

  emergencyContact: {
    name: String,
    phone: String,
    relation: String
  },

  joinedDate: {
    type: Date
  },

  additionalNotes: {
    type: String
  }

}, { timestamps: true });

module.exports = mongoose.model("StaffDetails", staffDetailsSchema);
