const express = require("express");
const router = express.Router();

const controller = require("../../controller/cocktails/cocktails");

router.get("/:user_id", controller.getCocktailList);

router.get("/:user_id/get/:id", controller.getCocktailByID);

router.get("/:user_id/update/:id", controller.updateFavorite);

module.exports = router;