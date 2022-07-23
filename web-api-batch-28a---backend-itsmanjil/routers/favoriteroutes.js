const { Router } = require("express");
const router = Router();
const { add, remove, favoritesByUser } = require("./favoriteController");
router.put("/:productid/:userid", add);
router.delete("/remove/:productid/:userid", remove);
router.get("/:userid", favoritesByUser);
module.exports = router;
