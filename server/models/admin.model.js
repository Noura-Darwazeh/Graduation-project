const mongoose = require("mongoose")
//سكيما
const adminSchema = mongoose.Schema({
    username: {
        required: true,
        type: String,
        trim: true,
        unique:true
    },
    password: {
        required: true,
        type: String
    }
});
const Admin = mongoose.model('Admin', adminSchema);
module.exports = Admin;
