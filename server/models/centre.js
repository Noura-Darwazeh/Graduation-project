const mongoose = require('mongoose')
const Schema = mongoose.Schema

const centreSchema = new Schema({
   name:{type:String,required:true,unique:true},
   imageUrl:{type:String,required:true},
   phone:{type:String,required:true,unique:true},
   city:{type:String,required:true},
   owner: {type:String,required:true},
   timesOfWork:{type:String,required:true}
},{
   timestamps:true
})

module.exports = mongoose.model('centre',centreSchema,'centres')