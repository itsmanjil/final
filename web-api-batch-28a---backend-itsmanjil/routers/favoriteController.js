const { Product } = require("../models/products");

exports.add = async (req, res) => {
  try {
    await Product.findByIdAndUpdate(
      req.params.productid,
      {
        $push: { favorites: req.params.userid },
      },
      { new: true }
    );
    await res.status(200).json({ success: true });
    console.log("Favorite succesfully added");
  } catch (err) {
    res.status(500).json(err.name + ": " + err.message);
    console.log(err.name + ": " + err.message);
  }
};

exports.remove = async (req, res) => {
  try {
    await Product.findByIdAndUpdate(
      req.params.productid,
      {
        $pull: { favorites: req.params.userid },
      },
      { new: true }
    );
    await res.status(200).json({ success: true });
    console.log("Favorite succesfully deleted");
  } catch (err) {
    res.status(500).json(err.name + ": " + err.message);
    console.log(err.name + ": " + err.message);
  }
};

exports.favoritesByUser = async (req, res) => {
  try {
    const product = await Product.find({
      favorites: req.params.userid,
    }).populate("owner_id");
    console.log(product);
    await res.status(200).json({
      product: product,
      total: product.length,
    });
  } catch (err) {
    res.status(500).json(err.name + ": " + err.message);
    console.log(err.name + ": " + err.message);
  }
};
