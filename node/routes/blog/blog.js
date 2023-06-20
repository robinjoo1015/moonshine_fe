const express = require("express");
const router = express.Router();

const controller = require("../../controller/blog/blog");

router.get("/:blogType", controller.getBlogList);
router.get("/get/:blogType/:blogId", controller.getBlogById);
router.post("/:blogType/create", controller.createBlog);
router.post("/:blogType/comment/:blogId", controller.createComment);
module.exports = router;