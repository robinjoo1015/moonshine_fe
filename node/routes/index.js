const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.send("Base url");
});

const CocktailRouter = require("./cocktails/cocktails");
const ImageRouter = require("./images/images");
const BarRouter = require("./bars/bars");
const UserRouter = require("./user/user");
const BlogRouter = require("./blog/blog");

router.use("/cocktails", CocktailRouter);
router.use("/images", ImageRouter);
router.use("/bars", BarRouter);
router.use("/user", UserRouter);
router.use("/blog", BlogRouter);

module.exports = router;