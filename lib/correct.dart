//import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:soft/product_detail.dart';
import 'package:soft/product_page.dart';
import 'package:soft/salonmodel.dart';
import 'package:soft/walaainfo.dart';

import 'order_history.dart';

class saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          gradient: new LinearGradient(colors: [Colors.black, Colors.pink])),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Successfully Order',
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 110),
            Center(
              child: Icon(
                Icons.check,
                size: 90,
                color: Colors.pink,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Your request is successful',
                      textStyle: const TextStyle(
                        color: Colors.pink,
                        fontSize: 30,
                      )),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Colors.black87, Colors.pink]),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.pink,
                          offset: Offset(2, 2))
                    ]),
                child: TextButton(
                  child: Text("Order Done".toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.7,
                      )),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyOrderScreen()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
