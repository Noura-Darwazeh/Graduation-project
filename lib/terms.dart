//import 'dart:html';
//import 'dart:math';

import 'package:flutter/material.dart';

class terms extends StatelessWidget {
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
              'Terms & Conditions',
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
                //  Text('Terms & Conditions',style: TextStyle(fontSize: 30),),
                Text(
                    'By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to Nada Abushanab.',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                    'Nada Abushanab is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                    'The Saloonati app stores and processes personal data that you have provided to us, to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Saloonati app won’t work properly or at all.',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                // Text(
                //     'The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Saloonati unless otherwise defined in this Privacy Policy.',
                //     style:
                //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                // Text('Information Collection and Use',style: TextStyle(fontSize: 20)),
                // Text(
                //     'The app does use third-party services that declare their Terms and Conditions.Link to Terms and Conditions of third-party service providers used by the app Google Play Services',
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ])),
    );
  }
}
