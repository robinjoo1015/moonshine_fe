const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.send("Base url");
});

const CocktailRouter = require("./cocktails/cocktails");
const ImageRouter = require("./images/images");

router.use("/cocktails", CocktailRouter);
router.use("/images", ImageRouter);

module.exports = router;