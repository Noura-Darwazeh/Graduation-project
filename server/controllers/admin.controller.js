const Product = require('../models/product.model')
const Centre = require('../models/centre')
const path = require('path')
var formidable = require('formidable');
var fs = require('fs');
const Admin = require('../models/admin.model')

exports.getProductsAndRedirect = (req,res) =>{
    Product.find({}).then(products =>{
        products.forEach(product =>{
            let path = "http://localhost:3000" + product.imageUrl.split('3000')[1]
            product.imageUrl = path
        })
        res.render('pages/products',{
            products:products
        })
    })
}

exports.getCentresAndRedirect = (req,res) =>{
    Centre.find({}).then(centres =>{
        centres.forEach(centre =>{
            let path = "http://localhost:3000" + centre.imageUrl.split('3000')[1]
            centre.imageUrl = path
        })

        console.log(centres)
        res.render('pages/centres',{
            centres:centres
        })
        
    })
}

exports.addProduct = (req,res) =>{
    let form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {
        const {name} = fields
        let oldpath = files.image.filepath;
        let newpath = './public/pics/products/' + name + path.extname(files.image.originalFilename);
        fs.rename(oldpath, newpath, function (err) {
            if (err) throw err;
        });
        let {price,description,centreName}= fields
        let urlPath = newpath.split('public')[1]
        let product = new Product({
            name:name,
            price:price,
            description:description,
            owner:centreName,
            imageUrl:`http://10.0.2.2:3000${urlPath}`
        })

        product.save().then(() =>{
            res.redirect('/admin/products');
        }).catch(err =>{
            res.status(400).json({
                reason:'error',
                message:err.message
            })
        })
    });
}

exports.addCentre = async (req,res)=>{  
    let form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {
        const {name} = fields
        const {owner} = fields
        let oldpath = files.image.filepath;
        let newpath = './public/pics/centres/' + name + path.extname(files.image.originalFilename);
        fs.copyFile(oldpath, newpath, function (err) {
            if (err) throw err;
        });
        let {city,phone,from,to}= fields
        console.log(fields)
        let urlPath = newpath.split('public')[1]
        from = from <= 12 ? (from < 10 ? `0${from}am` : `${from}am`) : `${from - 12}pm`
        to = to <= 12 ? (to < 10 ? `0${to}am` : `${to}am`) : `${to - 12}pm`
        let centre = new Centre({ 
            name:name,
            owner:owner,
            imageUrl:"http://10.0.2.2:3000" + urlPath,
            timesOfWork:`${from}-${to}`,
            city:city,
            phone:`0599${phone}`
        })

        centre.save().then(centre =>{
            res.redirect('/admin/centres');
        }).catch(err =>{
            res.status(400).json({
                reason:'error',
                message:err.message
            })
        })
 });
}

exports.editProductPage = (req,res) =>{
    Product.findOne({_id:req.params.id}).then(product =>{
        res.render('pages/editProduct',{
            product:product
        })
    })
}

exports.updateProduct = (req,res) =>{
    const {name,price,description} = req.body
    let product = { name,price,description }
    Product.findOneAndUpdate({_id:req.params.id},{$set: product}).then(updatedProduct =>{
        res.redirect('/products')
    }).catch(err =>{
        res.json({
            err:err.message
        })
    })
}

exports.deleteProduct = (req,res) =>{
    Product.findByIdAndRemove(req.params.id).then(() =>{
        res.redirect('/products')
    })
}

exports.editCentrePage = (req,res) =>{
    Centre.findOne({_id:req.params.id}).then(centre =>{
        res.render('pages/editCentre',{
            centre:centre
        })
    })
}

exports.updateCentre = (req,res) =>{
    console.log(req.body)
    const {name,phone,timesOfWork} = req.body
    console.log(req.body)
    Centre.findOne({ _id:req.params.id }).then(original =>{
        console.log(original)
        let centre = { 
            name:name,
            phone:'0599' + phone,
            timesOfWork:timesOfWork,
            city:original.city,
            imageUrl:original.imageUrl
        }

        Centre.findOneAndUpdate({_id:req.params.id},{$set: centre}).then(() =>{
            res.redirect('/centres')
        }).catch(err =>{
            res.json({
                err:err.message
            })
        })
    }).catch(err =>{
        console.log(err.message)
        res.json(err.message)
    })
   
}

exports.deleteCentre = (req,res) =>{
    Centre.findByIdAndRemove(req.params.id).then(() =>{
        res.redirect('/centres')
    })
}

exports.getCentres = (req,res) =>{
    Centre.find({}).then(centres =>{
        res.status(200).json(centres)
    })
}
exports.getCentresbyname = (req,res) =>{
    console.log(req.get("name"))
    Centre.find({ name :{ $regex : '.*'+req.get("name") + '.*', "$options": "i" }}).then(centres =>{
        res.status(200).json(centres)
    })
}
exports.loginAdmin = async (req,res) =>{
    const {username,password} = req.body
    try{
        const admin = await Admin.findOne({username:username,password:password})
        if(!admin) res.json({error:"no match was found"})
        else{
            res.cookie('isLogged',true, { maxAge: 900000, httpOnly: true })
            res.redirect('/admin')
        }
    }catch(err){
        throw err.message
    }
}