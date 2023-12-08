import 'package:http/http.dart';

// Salonati is the online destination for beauty & wellness professionals and cliente.
// Professionals can showcase their work, connect with new and existing clients,and build their business. Client can discover new services and providers,
// book appointments online, and get inspired.
//import 'dart:html';
//import 'dart:math';

import 'package:flutter/material.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   onPressed: () {},
            // ),
            title: Text(
              'About Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          body: //Text('Privacy Police' ),
              Column(
                  //  children[]: Text('Privacy Police' ),
                  children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                // Text(
                //   'About us',
                //   style: TextStyle(fontSize: 20),
                // ),
                Text(
                  '   Salonati is the online destination for beauty & wellness professionals and cliente.Professionals can showcase their work, connect with new and existing clients,and build their business. Client can discover new services and providers,  book appointments online, and get inspired.',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ])),
    );
  }
}
