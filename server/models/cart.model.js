const mongoose = require("mongoose")
const CartSchema =  mongoose.Schema(
{
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User"
  },
  products: [
  {
  quantity: {type:Number,default:1},
  name: {type:String,required:true},
  price: {type:Number,required:true},
  imageUrl:{type:String,required:true}
  }
  ],
 // product: [{}]
}
)

module.exports = mongoose.model('cart',CartSchema,'carts')