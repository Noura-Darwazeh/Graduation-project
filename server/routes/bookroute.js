const express = require('express')
const router = express.Router()
const bookController = require('../controllers/book.controller')


router.post("/book", bookController.addNewBook);
 router.get("/getbooks",  bookController.getbooks);
 router.get("/getbook",  bookController.getBook);
// router.put("/cart/products",cartController.updateCart)
// router.delete("/cart/products",cartController.deleteCartItem)


module.exports = router