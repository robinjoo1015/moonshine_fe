const express = require("express");
const router = express.Router();

const controller = require("../../controller/images/images");

// router.get("/", controller.getImageList);

router.get("/get/:id", controller.getImageById);
router.get("/DEBUG/download", controller.downloadFullImage);
router.get("/DEBUG/update/:id", controller.updateOneImage);
router.get("/DEBUG/update/from/:from/to/:to", controller.updateRangeImage);
module.exports = router;