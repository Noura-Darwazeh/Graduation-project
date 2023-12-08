import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft/chat/services/auth.dart';
import 'package:soft/features/home/screens/home_screens.dart';
import 'package:soft/features/home/screens/homemain.dart';
import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../models/user.dart';
import '../../../providers/user_provider.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
//import 'models/user.dart';

class auth {
  AuthService service = AuthService();
  void SignupUser(
      {required BuildContext context,
      required String username,
      required String role,
      required String email,
      //required String mobilenumber,
      required String password}) async {
    try {
      User user = User(
        id: '',
        username: username,
        password: password,
        role: role,
        email: email,
        //address: '',
        // type: '',
        // token: '',
        // cart: [],
        //mobilenumber: '',
      );

      print("URI=" + uri.toString());
      print("json=" + user.toJson().toString());
      http.Response res = await http.post(
        Uri.parse('$uri/users/api/signup'),
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      await service.registerWithEmailPassword(username, email, password);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
      print(res.statusCode);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/users/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      var rest = await service.signInWithEmailPassword(email, password);
      print(rest);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          FocusScope.of(context).unfocus();

          SharedPreferences prefs = await SharedPreferences.getInstance();
          // Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          await prefs.setString('role', jsonDecode(res.body)['role']);

          await prefs.setBool('isLogged', true);
          print(res.body);
          print(res.statusCode);
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          var u =
              Provider.of<UserProvider>(context, listen: false).user.toMap();
          print(u);
          FirebaseFirestore.instance.collection('users').doc(u["id"]).set(u);
          Navigator.pushNamed(context, salons.routeName);
          //Navigator.pushNamed(context, homemain.routeName);

          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => homemain()));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
