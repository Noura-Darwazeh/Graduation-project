//import 'package:amazon_clone_tutorial/models/user.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    username: '',
    role: '',
    email: '',
    password: '',
    // address: '',
    // type: '',
    // token: '',
    // cart: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void getUser() {
    print(_user.id);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
