// models/Client.js

const mongoose = require("mongoose");

const clientSchema = new mongoose.Schema({
  registrationId: { type: String, required: true, unique: true }, // e.g., L00001
  submissionDate: { type: Date, default: Date.now },
  lastUpdated: Date,

  assignedReviewer: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }, // agent _id

  status: {
    type: String,
    enum: ['Pending Review', 'Approved', 'Rejected'],
    default: 'Pending Review',
  },

  personalInfo: {
    fullName: String,
    contactNumber: String,
    email: String,
    dateOfBirth: Date,
    address: String, 
  },

  identityVerification: {
    idType: { type: String, default: 'NIC' },
    idNumber: String,
    documentUrl: String,
    verified: { type: Boolean, default: false }
  },

  employmentDetails: {
    employer: String,
    jobRole: String,
    monthlyIncome: Number,
    employmentDuration: String,
    employmentLetterUrl: String,
    verified: { type: Boolean, default: false }
  },

  documents: {
    idCardUrl: String,
    employmentLetterUrl: String,
    photoUrl: String,
    paysheetUrl: String,
    uploadedAt: Date,
    verified: { type: Boolean, default: false }
  },

  agentNotes: String,

  approvedAt: Date,
  rejectedAt: Date
}, {
  timestamps: true
});

module.exports = mongoose.model("Client", clientSchema);
