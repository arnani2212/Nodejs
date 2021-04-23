const express = require("express");
const app = express();
const accountRoutes = require("./routes/accountRoutes");
const taskRoutes = require("./routes/taskRoutes");
const bodyParser = require("body-parser");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }))

app.set('view engine', 'ejs');
app.use("/accounts", accountRoutes);
app.use("/tasks", taskRoutes);
app.use('/css', express.static(__dirname + '/public/css'));
app.use('/img', express.static(__dirname + '/public/img'));
app.use('/js', express.static(__dirname + '/public/js'));


// app.get("/login", (req, res) => {
//     res.render("login");
// })

// app.post("/login", (req, res) => {
//     res.redirect("/accounts/test");
//     // res.send(req.body.username);
// })




app.listen(3000);