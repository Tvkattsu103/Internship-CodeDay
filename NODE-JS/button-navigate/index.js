var express = require("express");
var app = express();
var port = process.env.PORT || 8080;
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
var path = process.cwd();

app.use('/controllers', express.static(process.cwd() + '/app/controllers'));
app.use('/public', express.static(process.cwd() + '/public'));

var mongoose = require("mongoose");
mongoose.Promise = global.Promise;
mongoose.connect("mongodb://localhost:27017/myapp", { useNewUrlParser: true, useUnifiedTopology: true });
var nameSchema = new mongoose.Schema({
   firstName: String,
   lastName: String
});
var User = mongoose.model("User", nameSchema);

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/public/index.html");
});



app.post("/addname", (req, res) => {
 var myData = new User(req.body);
myData.save()
    .then(item => {
        res.send("Name saved to database");
   })
   .catch(err => {
       res.status(400).send("Unable to save to database");
   });
});


app.route('/goData')
  .get(function (req, res) {
     res.sendFile(path + '/public/data.html');
 });


app.listen(port, () => {
 console.log("Server listening on port " + port);
});