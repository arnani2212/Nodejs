const express = require("express");
const router = express.Router();
const taskController = require("../controllers/taskController");
const auth = require("../auth");


router.get("/home", taskController.tasklist);
router.post("/add/:id", taskController.addTask);
router.post("/edit/:id", taskController.editTask);
router.get("/delete/:id", taskController.deleteTask);
// router.get("/home/:code", (req, res) => {
//     connection.query("SELECT * FROM tasks WHERE account_uuid='" + req.query.id + "'", (err, results) => {
//         if (err) {
//             throw err
//         }
//         // res.send(results);
//         res.render("tasklist", { data: results });

//     })
//     res.render("home");
//     // res.send(req.params.code);
// })

// app.get("/tasklist", (req, res) => {
//     var id = req.query.id;
//     connection.query("SELECT * FROM tasks WHERE account_uuid='" + req.query.id + "'", (err, results) => {
//         if (err) {
//             throw err
//         }
//         // res.send(results);
//         res.render("tasklist", { data: results });

//     })

//     // res.send(req.session.uuid);
// })
router.get("/register", (req, res) => {
    res.render("register");
})
module.exports = router;