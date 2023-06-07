const express = require("express");
const router = express.Router();

const controller = require("../../controller/user/user");

// router.get("/", controller.getImageList);

router.post("/login", controller.userLogin);
router.post("/create", controller.userCreate);
module.exports = router;