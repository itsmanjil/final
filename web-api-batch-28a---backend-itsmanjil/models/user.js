const mongoose = require("mongoose");
// const jwt = require('jsonwebtoken');
const validator = require("mongoose-unique-validator");
const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    unique: true,
  },
  password: {
    type: String,
    required: true,
  },
  phone: {
    type: String,
    required: true,
  },
  admin: {
    type: Boolean,
    default: false,
  },
  superadmin: {
    type: Boolean,
    default: false,
  },
});

userSchema.virtual("favorites", {
  ref: "Favorite",
  localField: "_id",
  foreignField: "user",
});

userSchema.plugin(validator);
const User = mongoose.model("user", userSchema);
module.exports = User;
