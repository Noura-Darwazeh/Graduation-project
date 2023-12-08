const mongoose = require('mongoose')
const Schema = mongoose.Schema

const bookSchema = new Schema({
    // id:{type:String,required:true,unique:true},
    bookDate:{type:Date,default: Date.now,required:true},
    startbook:{type:String,required:true},
    endbook:{type:String,required:true},
    nbrpersone:{type:Number,required:true},
    accepted:{type:Boolean,default:false},
    service:{type:String,required:true},
    phone:{type:String,required:true},
    salonid:{type:String,required:true},
    owner:{type:String,required:true},
    username:{type:String,required:true},
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User"
      },

    // idbooker: {
    //     type: mongoose.Schema.Types.ObjectId,
    //     ref: "User"
    //   },
   // imageUrl:{type:String,required:true}
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

module.exports = mongoose.model('book',bookSchema,'books')