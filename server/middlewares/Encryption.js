const bcrypt = require('bcrypt');

class Encryption{
    static CreateCipherPassword(plainPassword){
        return new Promise((resolve,reject) =>{
            bcrypt.hash(plainPassword,10).then(newHashedPassword =>{
                return resolve(newHashedPassword)
            }).catch(hashingError => reject(hashingError))
        })
    }

    static ComparePasswords(plainPassword,encryptedPassword){
        return new Promise((resolve,reject) =>{
            bcrypt.compare(plainPassword,encryptedPassword).then(isMatched =>{
                if(isMatched) return resolve(isMatched)
                return reject(isMatched)
            }).catch(matchingError => reject(matchingError))
        })
    }
}
module.exports = Encryption;