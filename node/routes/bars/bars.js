const express = require("express");
const router = express.Router();

const controller = require("../../controller/bars/bars");

router.get("/:user_id", controller.getBarList);

router.get("/:user_id/get/:id", controller.getBarById);

module.exports = router;