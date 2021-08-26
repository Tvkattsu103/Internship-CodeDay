const bcrypt = require('bcryptjs');
const config = require('config');

function hash_password(password){
    let saltRounds = config.get("salt");

    let salt = bcrypt.genSaltSync(saltRounds);
    const hash = bcrypt.hashSync(password, salt);

    return hash;
}

module.exports = {
    hash_password: hash_password
}