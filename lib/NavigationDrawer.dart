import 'package:flutter/material.dart';
import 'package:soft/doyouhave.dart';
import 'package:soft/privacy.dart';
import 'package:soft/terms.dart';

import 'aboutas.dart';
import 'contactus.dart';
import 'editprofile.dart';
import 'order_history.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SizedBox(
            height: 10,
          ),
          title: Text(''),
          onTap: () {},
        ),
        ListTile(
          leading: Image.asset('assets/logo.png'),
          title: Text(
            'Noura Darwazeh',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SizedBox(
            height: 20,
          ),
          title: Text(''),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.question_answer),
          title: Text('My Orders'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MyOrderScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.face_retouching_natural),
          title: Text('Do you have A salon?'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => havesalon()));
          },
        ),
        ListTile(
          leading: Icon(Icons.chat),
          title: Text('Contact us'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => contactus()));
          },
        ),
        ListTile(
          leading: Icon(Icons.question_mark),
          title: Text('About us'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => about()));
          },
        ),
        ListTile(
          leading: Icon(Icons.bookmark_outline),
          title: Text('Terms of Service'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => terms()));
          },
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip_outlined),
          title: Text('Privacy Policy'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => privacy()));
          },
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip_outlined),
          title: Text(' Policy'),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => editprofilepage()));
          },
        ),

        // ListTile(
        //   leading: Icon(Icons.privacy_tip_outlined),
        //   title: Text('English'),
        //   onTap: () {
        //    // controllerLang.changelang('ar');
        //     // Navigator.of(context)
        //     //  .push(MaterialPageRoute(builder: (context) => privacy()));
        //   },
        // ),
        // ListTile(
        //   leading: Icon(Icons.privacy_tip_outlined),
        //   title: Text('Arabic'),
        //   onTap: () {
        //     // Navigator.of(context)
        //     // .push(MaterialPageRoute(builder: (context) => privacy()));
        //   },
        // ),

        // ListTile(
        //   leading: Icon(Icons.question_answer),
        //   title: Text('My Orders'),
        //   onTap: () {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => MyOrderScreen()));
        //   },
        // ),
      ],
    );
  }
}
