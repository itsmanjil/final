const { Category } = require("../models/category");
const express = require("express");
const router = express.Router();

router.post("/", async (req, res) => {
  await Category.create(req.body)
    .then((category) => {
      if (!category) {
        res.status(400).json({
          success: false,
          message: "Category cannot be created",
        });
      } else {
        res.status(201).json({
          success: true,
          data: Category,
        });
      }
    })
    .catch((err) => {
      res.status(500).json({
        success: false,
        message: err,
      });
    });
});

router.get("/", async (req, res) => {
  const categoryList = await Category.find({});
  if (!categoryList) {
    res.status(500).json({
      success: false,
    });
  } else {
    res.status(201).json({
      success: true,
      data: categoryList,
    });
  }
});

router.get("/:id", async (req, res) => {
  const category = await Category.findById(req.params.id);
  if (!category) {
    res.status(404).json({
      success: false,
    });
  } else {
    res.status(201).json({
      success: true,
      data: category,
    });
  }
});

router.delete("/:id", async (req, res) => {
  await Category.findByIdAndRemove(req.params.id)
    .then((category) => {
      if (!category) {
        res.status(200).json({
          success: true,
          message: "Category deleted",
        });
      } else {
        res.status(400).json({
          success: false,
          message: "Category cannot be deleted",
        });
      }
    })
    //This is the server issue, not the client.
    .catch((err) => {
      res.status(500).json({
        success: true,
        message: err,
      });
    });
});

router.put("/:id", async (req, res) => {
  // To get the new updated data we set new to true
  await Category.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then(() => {
      if (!category) {
        res.status(200).json({
          success: true,
          message: "Category deleted",
        });
      } else {
        res.status(400).json({
          success: false,
          message: "Category cannot be deleted",
        });
      }
    })
    //This is the server issue, not the client.
    .catch((err) => {
      res.status(500).json({
        success: true,
        message: err,
      });
    });
});

module.exports = router;
