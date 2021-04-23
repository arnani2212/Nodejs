const account = require("../models/account");
const bcrypt = require("bcrypt");
const saltRounds = 10;
const mysql = require("mysql");
var connection = mysql.createPool({
    connectionLimit: 10,
    host: "localhost",
    user: "root",
    password: "",
    database: "tasks"
})
exports.createAccount = async(req, res) => {
    var salt = bcrypt.genSaltSync(saltRounds);
    req.body.password = bcrypt.hashSync(req.body.password, salt);
    req.body.code = generateCode();
    let data = await account.model.create(
        req.body
    )
    res.send(data);
    res.redirect("/accounts/logging");

}

exports.readAccount = async(req, res) => {
    let data = await account.model.findByPk(
        req.body.id, { raw: true }
    )
    res.send(data);
}

exports.updateAccount = async(req, res) => {
    let data = await account.model.update({ password: "PaSSWoRD" }, {
        where: {
            id: req.body.id
        }
    })
}

exports.deleteAccount = async(req, res) => {
    let data = await account.model.destroy({
            where: {
                id: req.body.id
            }
        })
        // res.send(data);
}
exports.login = async(req, res) => {
    let data = await account.model.findOne({
        where: {
            username: req.body.username
        },
        raw: true
    })
    if (bcrypt.compareSync(req.body.password, data.password) && data.password != "") {
        res.redirect("/tasks/home?id=" + data.code);
    } else {
        res.send({ code: 400 });
    }
}

exports.test = async(req, res) => {

    res.redirect("/accounts/logging");
}

generateCode = () => {
    let generate = "";
    const char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const length = 8;
    for (var i = 0; i < length; i++) {
        generate += char.charAt(Math.floor(Math.random() * char.length));
    }
    return generate;
}