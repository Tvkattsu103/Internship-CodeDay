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
app.use('/public', express.static(path.join(__dirname, 'public')))


app.get('/login', (req, res, next) => {
    res.sendFile(path.join(__dirname, 'login.html'))
})

app.post('/login', (req, res, next) => {
    var username = req.body.username
    var password = req.body.password

    AccountModel.findOne({
        username: username,
        password: password
    })
    .then(data =>{
        if(data){
            const token = jwt.sign({
                _id: data._id
            }, 'mk')
            return res.json({
                message: 'thanh cong',
                token: token
            })
        }else{
            return res.json('that bai')
        }
    })
    .catch(err =>{
        res.status(500).json('loi server')
    })
})

app.get('/private/', (req, res, next)=>{
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
    res.json('welcome')
})
app.listen(3000)