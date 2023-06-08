const express = require("express");
const router = express.Router();

const controller = require("../../controller/cocktails/cocktails");

router.get("/:user_id", controller.getCocktailList);

router.get("/:user_id/get/:id", controller.getCocktailByID);

module.exports = router;