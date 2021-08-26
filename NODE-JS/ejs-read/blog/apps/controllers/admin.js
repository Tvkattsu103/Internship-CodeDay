const express = require('express');
const router = express.Router();

const User = require('../models/user');
const helper = require('../helpers/helper');

router.get("/", (req, res) => {
    res.json({"message":"This is Admin Page"})
})

router.get("/signup", (req, res) => {
    res.render("signup", {data: {}})
})

router.post("/signup", (req, res) => {
    let user = req.body;
    
    if(user.email.trim().length == 0) {
        res.render("signup", {data: {error: "Email is required"}})
    }

    if(user.passwd != user.repasswd && user.passwd.trim().length != 0) {
        res.render("signup", {data: {error: "Password is not matched"}})
    }

    const password = helper.hash_password(user.passwd)
    //insert to DB
    user = {
        email: user.email,
        password: user.passwd,
        first_name: user.firstname,
        last_name: user.lastname
    };

    const result = User.addUser(user);

    if(!result){
        res.render("signup", {data: {error: "Could not insert user data to DB"}})
    }else{
        res.json({message: "Insert success"});
    }
})

module.exports = router;