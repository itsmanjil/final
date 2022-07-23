const mongoose = require("mongoose");
// const validator = require("mongoose-unique-validator");
const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
    minlength: 25,
    maxlength: 1024,
  },
  image: {
    type: String,
  },
  category: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Category",
    unique: true,
  },
  price: {
    type: Number,
    required: true,
    min: 100,
  },
  phone: {
    type: Number,
    // required: true,
  },
  negotiation: {
    type: Boolean,
    default: true,
  },
  availability: {
    type: Boolean,
    default: true,
  },
  owner_id: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "user",
  },

  delivery: {
    type: Boolean,
    default: false,
  },
  condition: {
    type: String,
    required: true,
  },
  usedFor: {
    type: String,
  },
  // comments: [{
  //     type: mongoose.Schema.Types.ObjectId,
  //     ref: 'ProductComment'
  // }]
  favorites: [],
});

// productSchema.plugin(validator);
exports.Product = mongoose.model("Product", productSchema);
