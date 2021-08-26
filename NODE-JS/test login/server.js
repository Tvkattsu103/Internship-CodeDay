const express = require('express')
const app = express()
const path = require('path')
var bodyParser = require('body-parser')
const AccountModel = require('./models/Accounts')
const jwt = require('jsonwebtoken')
var cookieParser = require('cookie-parser')
// var duongDanPublic = path.join(__dirname, 'public')

app.use(cookieParser())
app.use(bodyParser.urlencoded({ extended: false }))

app.use(bodyParser.json())
app.use('/blogtiengnhat', express.static(path.join(__dirname, 'blogtiengnhat')))
app.use('/public', express.static(path.join(__dirname, 'public')))

// app.use('/blogtiengnhat', express.static(path.join(__dirname, 'blogtiengnhat/task6_dangnhap')))


app.get('/login', (req, res, next) => {
    res.sendFile(path.join(__dirname, 'blogtiengnhat/task6_dangnhap/dangnhap.html'))
})

app.post('/login', (req, res, next) => {
    var username = req.body.username
    var password = req.body.password

    AccountModel.findOne({
        username: username,
        password: password
    })
    .then(data =>{
            const token = jwt.sign({id: data._id}, 'mk')
            res.json({
                message: 'thanh cong',
                token: token
            })
        })
    .catch(err =>{
        res.status(500).json('loi server')
    })
})

app.route('/goData')
        .get(function (req, res) {
            
            res.sendFile(path.join(__dirname, 'blogtiengnhat/task1_trangchu/trangchu.html'))
 });

app.get('/trangchu', (req, res, next)=>{
    try {
        var token = req.cookies.token
        var ketqua = jwt.verify(token, 'mk')
        if(ketqua){
            next()
        }
    } catch (error) {
        return res.redirect('/login')
    }
}, (req, res, next) =>{
    res.sendFile(path.join(__dirname, 'blogtiengnhat/task1_trangchu/trangchu.html'))
})
app.listen(3000)