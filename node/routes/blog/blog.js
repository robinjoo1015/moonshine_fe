const express = require("express");
const router = express.Router();

const controller = require("../../controller/blog/blog");

router.get("/:blogType", controller.getBlogList);

module.exports = router;