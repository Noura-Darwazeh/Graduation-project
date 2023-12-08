const express = require('express')
const productRouter = express.Router()
const productController = require('../controllers/product.controller')

productRouter.get('/getProducts',productController.getAllProducts)
productRouter.get('/centreProducts',productController.getCentreProducts)
productRouter.post('/addProduct',productController.addNewProduct)

module.exports = productRouter