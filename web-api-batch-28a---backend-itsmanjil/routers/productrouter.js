const express = require("express");
const { Category } = require("../models/category");
const { User } = require("../models/user");
const router = express.Router();
// we have to use {} in Product because model is returning an object
const { Product } = require("../models/products");
const mongoose = require("mongoose");
const auth = require("../authfile/auth");
const multer = require("multer");

const FILE_TYPE_MAP = {
  "image/jpeg": "jpeg",
  "image/png": "png",
  "image/jpg": "jpg",
};

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    const isValid = FILE_TYPE_MAP[file.mimetype];
    if (!isValid) cb(new Error("Invalid file type"), "./public/uploads/");
    else cb(null, "./public/uploads/");
  },
  filename: function (req, file, cb) {
    const extension = FILE_TYPE_MAP[file.mimetype];
    cb(null, `IMG-${Date.now()}.${extension}`);
  },
});

var uploadOptions = multer({ storage: storage });

router.post(
  "/",
  auth.verifyUser,
  uploadOptions.single("image"),
  async (req, res) => {
    const product = new Product({
      name: req.body.name,
      description: req.body.description,
      price: req.body.price,
      category: req.body.category,
      phone: req.body.phone,
      negotiation: req.body.negotiation,
      availability: req.body.availability,
      delivery: req.body.delivery,
      condition: req.body.condition,
      owner_id: req.body.owner_id,
      usedFor: req.body.usedFor,
      // comments: req.body.comments,
    });
    const category = await Category.findById(req.body.category);
    const file = req.file;
    if (!category) {
      return res.status(400).send("Invalid category");
    } else if (file) {
      const fileName = req.file.filename;
      const basePath = `${req.protocol}://${req.get("host")}/public/uploads/`;
      product.image = basePath + fileName;
    }
    await product
      .save()
      .then((createdProduct) => {
        res.status(201).json({ success: true, createdProduct });
      })
      .catch((err) => {
        res.status(500).json({
          error: err,
          success: false,
        });
      });
  }
);
//for flutter
router.get("/get", async (req, res) => {
  let categories = {};
  if (req.query.categories) {
    categories = { category: req.query.categories.split(",") };
  }

  const productList = await Product.find(categories).populate("category");

  if (!productList) {
    res.status(500).json({ success: false });
  } else {
    res.status(201).json({ success: true, data: productList });
  }
});

//react
router.get("/", (req, res) => {
  Product.find()
    .then(function (allproduct) {
      res.json(allproduct);
    })
    .catch(function (e) {
      res.json(e);
    });
});

router.get("/:id", (req, res) => {
  const id = req.params.id;
  Product.find({ _id: id })
    .then((result) => {
      if (result != null) {
        res.json({
          success: true,
          data: result,
        });
        return;
      }
    })
    .catch(() => {
      res.join({ message: "error" });
    });
});

router.put("/:id", auth.verifyUser, async (req, res) => {
  product = await Product.findByIdAndUpdate(
    req.params.id,
    {
      name: req.body.name,
      description: req.body.description,
      price: req.body.price,
      // category: req.body.category,
      phone: req.body.phone,
      negotiation: req.body.negotiation,
      availability: req.body.availability,
      delivery: req.body.delivery,
      condition: req.body.condition,
      // owner_id: req.body.owner_id,
      usedFor: req.body.usedFor,
    },
    { new: true, useFindAndModify: false }
  );

  if (!product)
    return res.status(404).send("this product is no longer here any more.");

  res.send(product);
});

// router.put("/:id", (req, res) => {
//   (id = req.body.id),
//     (names = req.body.name),
//     (description = req.body.description),
//     (price = req.body.price),
//     (phone = req.body.phone),
//     (negotiation = req.body.negotiation),
//     (availability = req.body.availability),
//     (delivery = req.body.delivery),
//     (condition = req.body.condition),
//     (owner_id = req.body.owner_id),
//     (usedFor = req.body.usedFor);
//   Product.updateOne(
//     { _id: id },
//     {
//       name: names,
//       descriptio: description,
//       price: price,
//       phone: phone,
//       negotiatiion: negotiation,
//       availability: availability,
//       delivery: delivery,
//       condition: condition,
//       owner_id: owner_id,
//       usedFor: usedFor,
//     }
//   ).then(() => {
//     res.json({ message: "succesfully updated." });
//   });
// });

router.delete("/:id", async (req, res) => {
  //If the :id is not in _id format then this message will be shown
  if (!mongoose.isValidObjectId(req.params.id)) {
    return res.status(400).send("Invalid product id");
  }

  await Product.findByIdAndRemove(req.params.id)
    .then((product) => {
      if (product)
        res
          .status(200)
          .json({ success: true, message: "Deleted successfully" });
      else
        res
          .status(404)
          .json({ success: false, message: "Cannot deleted a product" });
    })
    .catch((err) => {
      return res.status(500).json({
        success: false,
        error: err,
      });
    });
});

router.get("/bookmark/:id", async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    await user.populate("favorites");
    // await user.populated('recipes')
    await res.status(200).json(user.favorites);
  } catch (err) {
    res.status(500).json(err.name + ": " + err.message);
    console.log(err.name + ": " + err.message);
  }
});

module.exports = router;
