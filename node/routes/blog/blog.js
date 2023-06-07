const express = require("express");
const router = express.Router();

const controller = require("../../controller/blog/blog");

router.get("/:blogType", controller.getBlogList);
router.get("/get/:blogType/:blogId", controller.getBlogById);

module.exports = router;