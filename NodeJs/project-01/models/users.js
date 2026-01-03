const mongoose = require('mongoose');

const userSchema= new mongoose.Schema({
  firstName:{
    type: String,
    required: true
  },
  lastName:{
    type: String,
    required: true
  },
  email:{
    type: String,
    required: true,
    unique: true
  },
  gender:{
    type: String,
    required: true
  },
  jobTitle:{
    type: String,
    required: true
  }

},{timestamps: true});

//creating model for mongodb
const User = mongoose.model('User', userSchema);
module.exports = User;