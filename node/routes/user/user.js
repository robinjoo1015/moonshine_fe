const express = require("express");
const router = express.Router();

const controller = require("../../controller/user/user");

router.post("/login", controller.userLogin);
router.post("/create", controller.userCreate);
router.get("/:user_id/preference", controller.getUserPreference);

module.exports = router;