import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          gradient:
          new LinearGradient(colors: [Colors.black, Colors.pink])),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),

              SizedBox(
                width: 300.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Anton',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Welcome in Saloonati'),

                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              )

            ],
          ),
        ),



      ),
    );

  }


}