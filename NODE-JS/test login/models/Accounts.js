const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/quanlytaikhoan' , {
    useNewUrlParser : true,
    useUnifiedTopology : true
});

const Schema = mongoose.Schema;

const accountSchema = new Schema({
    username: String,
    password: String
}, {
    collection: "account"
});

const AccountModel = mongoose.model('account', accountSchema)
module.exports = AccountModel