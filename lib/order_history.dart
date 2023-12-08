import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavigationDrawer.dart';

class MyOrderScreen extends StatelessWidget {
  //static const routeName = myOrderScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Text(
                        " My Orders History",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                              height: 80,
                              width: 80,
                              child: Image.asset('assets/logo.png')),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              ' Saloonati',
                              style: TextStyle(fontSize: 20),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '# of order =1',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),

                            Column(
                              children: [
                                Row(children: [
                                  Text(
                                    'To:Wajh Alqamar Salon',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ]),

                                //  Row(
                                //   children: [
                                //     Text(
                                //       'From:Nada Abushanab',
                                //       style: TextStyle(
                                //           fontSize: 15,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //     SizedBox(
                                //       width: 25,
                                //     ),
                                //     Text(
                                //       'phone:05929937213',
                                //       style: TextStyle(fontSize: 20),
                                //     ),
                                //      Row(
                                //   children: [
                                //     Text(
                                //       'City:Tulkarem',
                                //       style: TextStyle(
                                //           fontSize: 15,
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //     SizedBox(
                                //       width: 25,
                                //     ),
                                //     Text(
                                //       'Address:Alqassem-st',
                                //       style: TextStyle(fontSize: 20),
                                //     ),

                                //   ],
                                // ),
                              ],
                            ),

                            // Column(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Text(
                            //           'City:Tulkarem',
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ],
                            //     )
                            //   ],
                            // ),
                            // Column(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Text(
                            //           'Address:Alqassem-st',
                            //           style: TextStyle(fontSize: 15),
                            //         ),
                            //       ],
                            //     )
                            //   ],
                            // ),

                            //  Row(
                            //   children: [
                            //     Text(
                            //       'From:Nada Abushanab',
                            //       style: TextStyle(
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     SizedBox(
                            //       width: 25,
                            //     ),
                            //     Text(
                            //       'phone:05929937213',
                            //       style: TextStyle(fontSize: 20),
                            //     ),
                            //      Row(
                            //   children: [
                            //     Text(
                            //       'City:Tulkarem',
                            //       style: TextStyle(
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     SizedBox(
                            //       width: 25,
                            //     ),
                            //     Text(
                            //       'Address:Alqassem-st',
                            //       style: TextStyle(fontSize: 20),
                            //     ),

                            //   ],
                            // ),

                            // Row(
                            //   children: [
                            //     Text('StatusAccept',style
                            //     TextStyle(
                            //         fontSize: 20
                            //     )

                            //       ,),

                            //   ],
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        ProductCard(
                          price: "96",
                          name: "Eye cream",
                        ),

                        ProductCard(
                          price: "10",
                          name: "Lipstick",
                        ),
                        ProductCard(
                          price: "50",
                          name: "COCO Scrup",
                        ),
                        // ProductCard(
                        //   price: "",
                        //   name: "",
                        // ),
                        // ProductCard(
                        //   price: "",
                        //   name: "",
                        //   isLast: true,
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Date',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "10/1/2022",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              " Sub Total",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "\$156",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Delivery Cost",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "\$20",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(color: Colors.grey
                          // thickness: 1.5,
                          ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            "\$176",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            //  Navigator.of(context)
                            //      .pushNamed(CheckoutScreen.routeName);
                          },
                          child:
                              // Text("Done"),
                              TextButton(
                            child: Text(" Done".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.7,
                                )),
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => NavigationDrawer()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //  Positioned(
          //    bottom: 0,
          //    left: 0,
          //     child :CustomNavBar(),
          //  ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required String name,
    required String price,
    bool isLast = false,
  })  : _name = name,
        _price = price,
        _isLast = isLast,
        super(key: key);

  final String _name;
  final String _price;
  final bool _isLast;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: _isLast
              ? BorderSide.none
              : BorderSide(
                  // color :AppColor.placeholder.withOpacity(0.25),
                  ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              " ${_name}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Text(
            "\$$_price",
            style: TextStyle(
              //color AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
