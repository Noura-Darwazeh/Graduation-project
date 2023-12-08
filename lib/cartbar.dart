import 'package:flutter/material.dart';
import 'package:soft/features/auth/services/cart.service.dart';

import 'checkoutpage.dart';

class cartbar extends StatefulWidget {
  @override
  State<cartbar> createState() => _cartbarState();
}

class _cartbarState extends State<cartbar> {
  late Future<Map<dynamic,dynamic>> items;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    items = getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
      child: FutureBuilder(
        future: items,
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData && !snapshot.hasError){
            var data = snapshot.data;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('',style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),),
                      Text("${data['totalPrice']}\$",style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),)
                    ],
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFF4C53A5),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:TextButton(
                        onPressed: () {   Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>check(

                            ))
                        ); },
                        child: Text(
                          'Check Out',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      )


                  )
                ],
              ),
            );
          }else{
            return Container(
              child: Text("not defined"),
            );
          }
        },
      ),

    );
  }
}