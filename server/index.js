const express = require("express");
const mongoose = require("mongoose")
const authRouter = require("./routes/auth")
const cartRouter = require('./routes/cart')
const bookRouter = require('./routes/bookroute')
const productRouter = require('./routes/product.route')
const bodyParser = require('body-parser')
const path = require('path')
const adminRender = require('./routes/admin')


const app = express();
const jwt = require('jsonwebtoken')
app.set('view engine','ejs')
app.use(express.static(path.join(__dirname,'public')))
const cookieParser = require('cookie-parser');
const { flatMapSeries } = require("async");
app.use(cookieParser())
const Db = "mongodb+srv://noura:noura@cluster0.9lz57d9.mongodb.net/firstdb?retryWrites=true&w=majority"
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))
app.use('/users',authRouter);
app.use('/products',productRouter)
app.use('/users',cartRouter)
app.use('/books',bookRouter)
const PORT = 3000;

mongoose.connect(Db).then(()=> {
    console.log("connected");
}).catch((e) => {
    console.log(e);
});

app.use((req,res,next) =>{
    res.locals.isLogged = req.cookies.isLogged
    next()
})

app.get('/admin',(req,res) =>{
    if(req.cookies.isLogged == undefined || req.cookies.isLogged == false){
        res.redirect('/admin/login')
    }else{
        res.render('index')
    }
})

app.use('/',adminRender)
app.get('*',(req,res) =>{
    res.redirect('/admin')
})
app.listen(PORT, () => {
console.log(`connected at port ${PORT}`);
});