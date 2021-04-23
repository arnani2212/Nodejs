const express = require("express");
const router = express.Router();
const accountController = require("../controllers/accountController");
const auth = require("../auth");

router.post("/create_account", accountController.createAccount);
router.get("/read_account", auth.checking, accountController.readAccount);
router.post("/update_account", accountController.updateAccount);
router.post("/delete_account", accountController.deleteAccount);

router.post("/login", accountController.login);

router.post("/test", accountController.test);

router.get("/logging", (req, res) => {
    res.render("login");
})

router.get("/register", (req, res) => {
    res.render("register");
})
module.exports = router;