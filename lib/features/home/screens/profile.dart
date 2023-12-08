import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft/providers/user_provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return SafeArea(
        child: ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.pink,
            radius: 50,
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("name:"),
              Text(
                "${user.username}",
              ),
              SizedBox(
                height: 20,
              ),
              Text("Email:"),
              Text("${user.email}"),
            ],
          ),
        ),
      ],
    ));
  }
}
