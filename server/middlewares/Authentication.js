const jwt = require("jsonwebtoken");

class Authentication{
    static CreateToken(TokenPayload){
        return new Promise((resolve,reject) =>{
            jwt.sign(TokenPayload,process.env.JWT_PRIVATE_KEY,{expiresIn:"24h"},(tokenError,asyncToken) =>{
                if(tokenError) reject(tokenError)
                resolve(asyncToken)
            })
        })
    }

    static CheckToken(token){
        return new Promise((resolve,reject) =>{
            jwt.verify(token,process.env.JWT_PRIVATE_KEY,{},(decodeError,decodedToken) =>{
                if(decodeError) reject(decodeError)
                resolve(decodedToken)
            })
        })
    }
}

module.exports = Authentication