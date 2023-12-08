const mongoose = require("mongoose")
//سكيما
const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    role: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
    },
    password: {
        required: true,
        type: String
    }
});
const User = mongoose.model('User', userSchema);
module.exports = User;
