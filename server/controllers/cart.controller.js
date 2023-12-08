const Cart = require('../models/cart.model')
const jwt = require('jsonwebtoken')


exports.addCart = (req, res) =>{
//TODO:get product data to cart
  const {name,price,quantity,token,imageUrl} = req.body
    jwt.verify(token,"passwordKey",{},(decodeError,decodedToken) =>{
     console.log(decodedToken)
     Cart.findOne({ userId:decodedToken.id}).then(result =>{
      let parsed = Number(price.split('').filter(chr => chr != '$').join(''))
        if(!result){
            let newCart = new Cart({
                userId:decodedToken.id,
                products:[{name,price:parsed,quantity,imageUrl}]
            })

            newCart.save().then(savedCart => console.log(savedCart))
        }else{
          let itemIndex = result.products.findIndex(p => p.name == name);

            if (itemIndex > -1) {
                let productItem = result.products[itemIndex];
                productItem.quantity += +quantity;
                result.products[itemIndex] = productItem;
              } else {
                //product does not exists in cart, add new item
                result.products.push({ quantity, name, price:parsed,imageUrl });
              }
            result.save().then((crt) =>{
              console.log(crt)
                  return res.status(201).send(crt.products);
              }).catch(error =>{});
        }
     })
//     Cart.find().populate('userId').exec(function(err,cart){
//        if(err) console.log(err.message)
////     console.log(cart)
//                    if (cart) {
//

//
//                        } else {
//                            console.log('no cart')
//                          //no cart for user, create new cart
//                          let newCart = new Cart({
//                            userId:decodedToken.id,
//                            products: [{ quantity, name, price }]
//                          })
//                          newCart.save().then(newCart2 =>{
//                                console.log(newCart2)
//                              return res.status(201).send(newCart.products);
//                          }).catch(error =>{})
//
//                        }
//                })
    })
}

function getTotalPrice(products){
    let total = 0;
    for(let i = 0;i < products.length;i++){
        total = total + (products[i].price * products[i].quantity)
    }

    return total;
}

exports.getCartItems = (req,res) =>{
    const { token } = req.headers
    jwt.verify(token,"passwordKey",{},(decodeError,decodedToken) =>{
        if(decodeError) {
            console.log(decodeError.message)
            res.status(500).json({ success:false })
        }
        Cart.findOne({userId:decodedToken.id}).then(result =>{
            let totalPrice = getTotalPrice(result.products)
            res.status(200).json({
                products:result.products,
                totalPrice:totalPrice
            })
        })
    })
}

exports.updateCart = (req,res) =>{
    const {token,name,count} = req.body

    jwt.verify(token,"passwordKey",{},(decodeError,decodedToken) =>{
        Cart.findOne({userId:decodedToken.id}).then(cart =>{
            let itemIndex = cart.products.findIndex(p => p.name == name);
            let productItem = cart.products[itemIndex];
            productItem.quantity += +count;
            cart.products[itemIndex] = productItem;
    
            cart.save().then(modifiedCart =>{
                console.log(modifiedCart)

                res.json(modifiedCart)
            })
        }).catch(err =>{
    
        })
    })
}


exports.deleteCartItem = (req,res) =>{
    const {token,name} = req.headers

    jwt.verify(token,"passwordKey",{},(decodeError,decodedToken) =>{
        Cart.findOne({userId:decodedToken.id}).then(cart =>{
            let productItem = cart.products.filter(p => p.name != name);
            cart.products = productItem;
    
            cart.save().then(modifiedCart =>{
                console.log(modifiedCart)

                res.json(modifiedCart)
            })
        }).catch(err =>{
    
        })
    })

}