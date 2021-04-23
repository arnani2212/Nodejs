const task = require("../models/task");
const account = require("../models/account");


exports.test = async(req, res) => {
    console.log("sample");
    res.send(req.query.id);

}

exports.addTask = async(req, res) => {


    req.body.status = "pending";
    req.body.account_code = req.params.id;
    let data = await task.model.create(
        req.body
    )
    res.redirect("back");
    // res.send(req.params.id);

}
exports.tasklist = async(req, res) => {
    let data = await task.model.findAll({
        where: {
            account_code: req.query.id
        },
        raw: true
    })
    let accdata = await account.model.findOne({
        where: {
            code: req.query.id
        },
        raw: true
    })
    res.render("home", { result: data, accres: accdata });

}

exports.editTask = async(req, res) => {
    let data = await task.model.update({ task: req.body.task, status: req.body.status, completedAt: req.body.completedAt }, {
        where: {
            id: req.params.id
        }
    })
    res.redirect("back");
}

exports.deleteTask = async(req, res) => {
    let data = await task.model.destroy({
        where: {
            id: req.params.id
        }
    })
    res.redirect("back");
    // res.send(data);
}