const express = require('express')
const router = express.Router()
const adminControllers = require('../controllers/admin.controller')
const Centre = require('../models/centre')
const Users = require('../models/user')


router.get('/admin/login',(req,res) =>{
    res.render('login')
})


router.post('/admin/login',adminControllers.loginAdmin)
router.get('/admin/centres',adminControllers.getCentresAndRedirect)
router.get('/admin/products',adminControllers.getProductsAndRedirect)
router.get('/products/create',(req,res) =>{
    Centre.find({}).then(centres =>{
        res.render('pages/createProduct',{
            centres:centres
        })
    })
})
router.get('/centres/create',(req,res) =>{
    Users.find({role:"CentreOwner"}).then(users =>{
        res.render('pages/createCentre',{
            users:users
        })
    })
})
router.get('/admin/logout',(req,res) =>{
    res.cookie('isLogged',false, { maxAge: 900000, httpOnly: true })
    res.redirect('/admin/login')
})

router.post('/centres/create',adminControllers.addCentre)
router.post('/products/create',adminControllers.addProduct)

router.get('/products/:id/delete',adminControllers.deleteProduct)
router.get('/products/:id/update',adminControllers.editProductPage)
router.post('/products/:id/update',adminControllers.updateProduct)
router.get('/centres/:id/update',adminControllers.editCentrePage)
router.get('/centres/:id/delete',adminControllers.deleteCentre)
router.post('/centres/:id/update',adminControllers.updateCentre)

router.get('/centres',adminControllers.getCentres)
router.get('/getcentres',adminControllers.getCentresbyname)

module.exports = router