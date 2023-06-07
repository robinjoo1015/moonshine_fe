const express = require("express");
const router = express.Router();

const controller = require("../../controller/bars/bars");

router.get("/", controller.getBarList);

router.get("/get/:id", controller.getBarById);

module.exports = router;