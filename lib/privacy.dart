//import 'dart:html';
//import 'dart:math';

import 'package:flutter/material.dart';

class privacy extends StatelessWidget {
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
              'Privacy Police',
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
                  height: 10,
                ),
                Text(
                  'Nada Abushanab built the Saloonati app as a Free app. This SERVICE is provided by Nada Abushanab at no cost and is intended for use as is.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                    'This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                    'If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                    'The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Saloonati unless otherwise defined in this Privacy Policy.',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                // Text('Information Collection and Use',
                //     style:
                //         TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text(
                    'For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ])),
    );
  }
}
