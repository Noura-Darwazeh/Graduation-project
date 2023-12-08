const mongoose = require('mongoose')
const Schema = mongoose.Schema

const productSchema = new Schema({
    name:{type:String,required:true,unique:true},
    price:{type:Number,required:true},
    description:{type:String,required:true},
    owner:{type:String,required:true},
    imageUrl:{type:String,required:true}
},{
    timestamps:true
})

// const CounterSchema = new Schema({
//     _id:{ type:String,required:true },
//     value:{ type:Number,default:0 }
// })

// const Counter = mongoose.model('counter',CounterSchema,'counters')
// Counter.findOne({ _id:"productsCounter" }).then(counter =>{
//     if(!counter) new Counter({ _id:'productsCounter' }).save();
// })


// productSchema.pre('save',function(next){
//     let product = this;
//     Counter.findByIdAndUpdate({_id:'productsCounter'},{$inc:{ value:1 }},function(err,counter){
//         if(err) return next(err)
//         product.productId = counter.value
//         console.log(product)
//         next()
//     })
// })

module.exports = mongoose.model('product',productSchema,'products')