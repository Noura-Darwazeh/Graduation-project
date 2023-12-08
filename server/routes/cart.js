const express = require('express')
const router = express.Router()
const cartController = require('../controllers/cart.controller')


router.post("/cart", cartController.addCart);
router.get("/cart/products", cartController.getCartItems);
router.put("/cart/products",cartController.updateCart)
router.delete("/cart/products",cartController.deleteCartItem)


module.exports = router