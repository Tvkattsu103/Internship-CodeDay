const express = require('express');
// const config = require('config');
const bodyParser = require('body-parser');

const app = express();
//body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.set("views",__dirname + "/apps/views");
app.set("view engine","ejs");

//Static folder
app.use("/static", express.static(__dirname + "/public"))

const controllers = require(__dirname + "/apps/controllers");

app.use(controllers);

const host = 'localhost';
const port = 5000

app.listen(port, host, () => {
    console.log(`Server is running on port ${host}:${port}`)
})