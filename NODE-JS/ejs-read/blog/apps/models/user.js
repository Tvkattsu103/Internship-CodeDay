const q = require('q')
const db = require('../common/database');

const conn = db.getConnection();

function addUser(user){
    if(user){
        const defer = q.defer();

        const query = conn.query('INSERT INTO users SET ?', user,function(err,result) {
            if(err){
                defer.reject(err);
            }else{
                defer.resolve(result);
            }
        })
        return defer.promise;
    }
    return false;
}

module.exports = {
    addUser: addUser
}