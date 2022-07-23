const mongoose = require("mongoose");
const { ObjectId } = mongoose.Schema;
const favoriteSchema = new mongoose.Schema(
  {
    product: {
      type: ObjectId,
      ref: "Product",
      require: true,
    },
    user: {
      type: ObjectId,
      ref: "User",
      require: true,
    },
  },
  { timestamps: true }
);
module.exports = mongoose.model("Favorite", favoriteSchema);
