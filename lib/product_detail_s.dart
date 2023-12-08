import 'package:flutter/material.dart';
//import 'package:soft/products_s.dart';
import 'bottom_bar.dart';

class product_detail_s extends StatelessWidget{
  late final assetpath,product_price,product_name;
  product_detail_s({this.assetpath, this.product_price, this.product_name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context)=>products_s(

              //     ))
              // );

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
              child: Image.asset(assetpath,
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
              child: Text('Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
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
                      child: Text('Add to cart',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ))
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.shopping_bag),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:bar(),

    );


  }

}