import 'package:flutter/material.dart';
import 'package:soft/cart.dart';
import 'package:soft/correct.dart';



class check extends StatefulWidget {
  @override
  _checkstate createState() => _checkstate();
}

class _checkstate extends State<check> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
            gradient:
            new LinearGradient(colors: [Colors.black, Colors.pink])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
                children: [

                  Container(
                    margin: EdgeInsets.only(top: height * 0.11),
                    height: height * 0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2000),
                            topRight: Radius.circular(2000))),
                    child: ListView(
                      children: [
                        Text(
                          'Check Out'.toUpperCase(),
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),

                        Center(
                          child: Container(
                            height: 1,
                            width: width * 0.8,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, letterSpacing: 1.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.pink),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(20),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Phone number",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, letterSpacing: 1.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.blue),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Street",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, letterSpacing: 1.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.blue),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "City",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, letterSpacing: 1.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.blue),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Any additions to your order",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, letterSpacing: 1.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.blue),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        // Center(
                        //   child: Container(
                        //     padding:
                        //     EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        //     decoration: BoxDecoration(
                        //         gradient: new LinearGradient(
                        //             colors: [Colors.black87, Colors.pink]),
                        //         borderRadius: BorderRadius.circular(20),
                        //         boxShadow: [
                        //           BoxShadow(
                        //               blurRadius: 4,
                        //               color: Colors.pink,
                        //               offset: Offset(2, 2))
                        //         ]),
                        //     child: TextButton(
                        //       child: Text(
                        //           "Check Out".toUpperCase(),
                        //           style: TextStyle(
                        //               fontSize: 20,
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold,
                        //               letterSpacing: 1.7),
                        //           textAlign: TextAlign.center,
                        //         ), onPressed: (){},
                        //     ),
                        //
                        //   ),
                        // ),
                        Container(

                          height: 50,
                          margin: EdgeInsets.only(top:2,bottom: 8),
                          child:ListView(
                            scrollDirection:Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:5,right:5),
                                child: TextButton(
                                    onPressed: (){
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(1000),

                                            gradient: new LinearGradient(
                                                colors: [Colors.black87, Colors.pink]),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  color: Colors.pink,
                                                  offset: Offset(2, 2))
                                            ]
                                        ),
                                        child:Padding(

                                          padding: const EdgeInsets.all(0.0),

                                          child: TextButton(
                                            child: Text(
                                              "Save Order".toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.7),
                                              textAlign: TextAlign.center,
                                            ), onPressed: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>saved()));

                                          },
                                          ),
                                        )

                                    )),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:5,right:5),
                                child: TextButton(
                                    onPressed: (){
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(20),

                                            gradient: new LinearGradient(
                                                colors: [Colors.black87, Colors.pink]),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  color: Colors.pink,
                                                  offset: Offset(2, 2))
                                            ]
                                        ),
                                        child:Padding(

                                          padding: const EdgeInsets.all(0.0),

                                          child: TextButton(
                                            child: Text(
                                              "Cancel Order".toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),

                                              textAlign: TextAlign.center,

                                            ),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cart()));

                                            },
                                          ),
                                        )

                                    )),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ])
        ));
  }
}

