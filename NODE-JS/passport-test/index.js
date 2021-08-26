const express = require('express');
const app = express();
const morgan = require('morgan');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const session = require('express-session');
const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy
const fs = require('fs')


//
var mongodb = require('mongodb');
var MongoClient = mongodb.MongoClient;
var URL = 'mongodb://127.0.0.1:27017/mainDB';

var db;
var error;
var waiting = []; // Callbacks waiting for the connection to be made

MongoClient.connect(URL, function (err, database) {
    error = err;
    db = database;

    waiting.forEach(function (callback) {
        callback(err, database);
    });
});

module.exports = function (callback) {
    if (db || error) {
        callback(error, db);
    } else {
        waiting.push(callback);
    }
}

//
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const userSchema = new Schema({
    username: String,
    password: String
});

app.set('port', (process.env.PORT || 3004));

app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*'); // Permissive CORS header
    res.setHeader('Cache-Control', 'no-cache');
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, OPTIONS');
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.use(morgan('combined'));
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(session({ secret: 'keyboard cat', resave: false, saveUninitialized: false }));
app.use(passport.initialize());
app.use(passport.session());

//passport
function verify(username, password, done) {

    db.collection("users").findOne({ username: username })
        .then(
            doc => {
                if (!doc) {
                    console.log(`User ${username} doesn't exist`);
                    done(null, false, { message: "User doesn't exist" });
                }
                if (doc.password != password) {
                    console.log(`${password} is the wrong password`);
                    done(null, false, { message: "Wrong password" });
                }
                else {
                    console.log("AOK");
                    done(null, doc);
                }
            },
            reason => done(reason)
        );
}

passport.use(new LocalStrategy(verify));

passport.serializeUser(function (user, done) {
    console.log("Serialize here, got " + JSON.stringify(user));
    done(null, user._id);
});
passport.deserializeUser(function (id, done) {
    db.collection("users").findOne({ _id: mongodb.ObjectId(id) })
        .then(
            doc => done(null, doc),
            reason => done(reason)
        );
});

//router
app.get("/login", (req, res) => {
    fs.readFile("./login.html", "utf8", (err, data) => {
        if (err) throw err;
        res.send(data);
    })
});

app.post("/login", passport.authenticate("local", {
    failureRedirect: '/login',
}), (req, res) => { res.redirect("/authenticated") });

var ensureLoggedIn = require('connect-ensure-login').ensureLoggedIn("/login");
app.get("/authenticated", ensureLoggedIn, (req, res) => res.send("o hai"));
app.get("/unauthenticated", (req, res) => res.send("o hai"));

app.listen(app.get('port'), () => {
    console.log('Server started: http://localhost:' + app.get('port') + '/');
});