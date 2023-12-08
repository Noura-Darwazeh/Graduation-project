const centre = require('../models/centre.js');
let Product = require('../models/product.model.js');

exports.getAllProducts = async (req,res) =>{
    let products = await Product.find({},{__v:false})
    res.status(200).json(products)
}

exports.addNewProduct = (req,res) =>{
//    const { name,price,quantity } = req.body
    const name = "test",price=100,quantity=3
    new Product({name:name,price:price,quantity:quantity}).save()
        .then(newProduct => {
            res.status(201).json({
                success:true,
                data:newProduct
            })
        })
        .catch(saveProductError => {
            return res.status(500).json({
                success:false,
                message:saveProductError.message
            })
        })
}

exports.getCentreProducts = (req,res) =>{
    const name = req.headers['centrename']
    console.log(name)
    Product.find({owner:name}).then(centreProducts =>{
        res.status(200).json(centreProducts)
    })
}