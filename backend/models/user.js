//(Sample Mongoose schema)
// models/User.js
const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name: String,
  email: {
    type: String,
    required: true,
    unique: true
  },
});

module.exports = mongoose.model('User', userSchema);
