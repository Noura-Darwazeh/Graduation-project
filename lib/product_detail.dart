import 'package:flutter/material.dart';
//import 'package:grad/product_page3.dart';
import 'package:soft/products.dart';

import 'bottom_bar.dart';
import 'cart.dart';
import 'features/auth/services/cart.service.dart';

class product_detail extends StatelessWidget{
  late final assetpath,product_price,product_name,product_description;
  product_detail({this.assetpath, this.product_price, this.product_name, required this.product_description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();

            },icon:Icon(Icons.arrow_back,color: Colors.black,)
        ),
        title: Text('Products',style: TextStyle(fontSize: 20,color: Color(0xFF545D68)),),
        actions: <Widget>[
          IconButton(
              onPressed: (){},icon:Icon(Icons.notifications_none,color: Colors.black,)
          ),


        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 60,),

          Hero(tag: assetpath,
              child: Image.network(assetpath,
                height: 200,
                width: 180,
                fit: BoxFit.contain,
              )),
          SizedBox(height: 20.0),
          Center(
            child: Text(product_price,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF17532))),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(product_name,
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 24.0)),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              //TODO:ADD DESCRIPTION FROM DATABASE
              child: Text(product_description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFFB4B8B9))
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xFFF17532)
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      child: GestureDetector(
                        onTap: (){
                          addToCart(name: product_name,price: product_price,quantity: "1",imageUrl: assetpath);
                        },
                        child: Text(
                          'Add To Card',style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white

                          ),//بال
                        ),
                      ),
                    ),

                  )
              )),


     ] ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>cart(

              ))
          );
          getCartItems();
        },backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.shopping_bag),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:bar(),

    );


  }

}