const express = require("express");
const router = express.Router();

const controller = require("../../controller/cocktails/cocktails");

router.get("/", controller.getCocktailList);

router.get("/get/:id", controller.getCocktailByID);

module.exports = router;