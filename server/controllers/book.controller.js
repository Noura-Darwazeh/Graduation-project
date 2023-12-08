let Book = require('../models/bookmodel');
const jwt = require('jsonwebtoken')
exports.getbooks = async (req,res) =>{
    let Books = await Book.find({},{__v:false})
    res.status(200).json(Books)
}

exports.addNewBook = (req,res) =>{
    console.log(req.body);
    const {bookDate,startbook,endbook,nbrpersone,service,phone,userId,salonid,owner,username} = req.body

     jwt.verify(userId,"passwordKey",{},(decodeError,decodedToken) =>{
//    const { name,price,quantity } = req.body
// bookDate=Date.now()
// startbook="08:00"
// endbook="10:00"
// nbrpersone=100
// phone="0666730610"
// service="Salon jamil"

//idbooker=

   // const name = "test",price=100,                                                
   quantity=3

   var date = new Date(bookDate).toLocaleString('en-US', {
    timeZone: 'Asia/Calcutta'
  });

console.log(date)
    new Book({userId:decodedToken.id,salonid:salonid,username:username,bookDate:date,owner:owner,startbook:startbook,endbook:endbook,nbrpersone:nbrpersone,service:service,phone:phone}).save()
        .then(newBook => {
            res.status(201).json({
                success:true,
                data:newBook
            })
        })
        .catch(saveBookError => {
            return res.status(500).json({
                success:false,
                message:saveBookError.message
            })
        })})
}

exports.getBook = (req,res) =>{
const owner=req.headers['owner']
console.log(owner);
    Book.find({owner:owner}).then(centreBooks =>{
        console.log(centreBooks)
        res.status(200).json(centreBooks)
    })
}