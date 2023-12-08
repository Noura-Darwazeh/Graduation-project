import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soft/features/auth/services/cart.service.dart';

class cartItemSamples extends StatefulWidget{
  @override
  State<cartItemSamples> createState() => _cartItemSamplesState();
}

class _cartItemSamplesState extends State<cartItemSamples> {
  late Future<List<dynamic>> products;
  late Future<Map<dynamic,dynamic>> details;

  @override
  void initState(){
    super.initState();
    details = getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: details,
      builder: (context,AsyncSnapshot snapshot){
        if(snapshot.hasData && !snapshot.hasError){
          var data = snapshot.data;
          return ListView.builder(
            itemCount: data['products'].length,
            itemBuilder: (BuildContext context,int index){
              return Container(
                height: 110,
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.only(right: 15),
                      child: Image.network("${data['products'][index]['imageUrl']}"),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data['products'][index]['name'],style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                          Text('\$${data['products'][index]['price']}',style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         IconButton (
                           onPressed: (){
                             deleteCartItem(name: data['products'][index]['name']);
                           },
                            icon: Icon(
                              Icons.dangerous,
                              color: Colors.red,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(.5),
                                          spreadRadius: 1,
                                          blurRadius: 10
                                      ),
                                    ]
                                ),
                                child: GestureDetector(
                                  onTap: (){
                                    updateCartItemCount(
                                        count: 1,
                                        name: data['products'][index]['name']
                                    );
                                  },
                                  child: Icon(
                                    CupertinoIcons.plus,
                                    size: 18,

                                  ),
                                )
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "${data['products'][index]['quantity']}",style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue
                                ),
                                ),

                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(.5),
                                          spreadRadius: 1,
                                          blurRadius: 10
                                      ),
                                    ]
                                ),
                                child: GestureDetector(
                                  onTap: (){
                                    updateCartItemCount(
                                        count: -1,
                                        name: data['products'][index]['name']
                                    );
                                  },

                                  child: Icon(
                                    CupertinoIcons.minus,
                                    size: 18,

                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),


                    )
                  ],
                ),
              );
            },
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}