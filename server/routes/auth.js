const express = require("express");
const User = require("../models/user");
const Encryption = require('../middlewares/Encryption')
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

authRouter.post("/api/signup", (req,res) => {
    const {name, email, password,role} = req.body;
console.log(req.body)
    User.findOne({ email }).then(user =>{
        if(user) return res.status(400).json({ msg: "this email exist"})
        Encryption.CreateCipherPassword(password).then(hashedPassword =>{
        console.log(hashedPassword)
            new User({
                name:name,
                email:email,
                role:role,
                password:hashedPassword
            }).save().then(newUser =>{
                // let token = jwt.sig()
                return res.status(201).json(newUser)
            }).catch(hashingError => res.status(500).json(hashingError.message))
        })
    });
});

//sign in
authRouter.post("/api/signin", (req, res) => {
    const { email, password } = req.body;

    User.findOne({ email:email }).then(user =>{
        if(!user) return res.status(400).json({success:false})
        Encryption.ComparePasswords(password,user.password).then(isMatched =>{
            console.log(isMatched)
            if(!isMatched) return res.status(400).json({ msg: "Incorrect password." });
            const token = jwt.sign({ id: user._id }, "passwordKey");
            res.json({ token, ...user._doc });
        }).catch(err =>{
            res.status(400).json({
                success:false,
                message:err.message
            })
        })
    })
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.headers["x-auth-token"];
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.get('/',(req,res)=>{
    User.find({},{__v:false}).then(users =>{
         res.json(users)
    })
})

authRouter.delete('/:_id',(req,res) =>{
    const _id = req.params._id
    User.findOneAndRemove({_id:_id}).then(() =>{
        console.log('deleted succussfully')
    })

    res.json({
        success:true
    })
})

module.exports = authRouter

