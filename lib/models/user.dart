import 'dart:convert';

class User {
  String id;
  final String username;
  final String email;
  final String role;
  //final String mobilenumber;
  final String password;

  User(
      {required this.id,
      required this.username,
      required this.role,
      required this.email,
      //required this.mobilenumber,
      required this.password});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': username,
      'role': role,
      'email': email,
      //'mobilenumber':mobilenumber,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      role: map['role'] ?? '',
      username: map['name'] ?? '',
      email: map['email'] ?? '',
      //mobilenumber: map['mobilenumber']?? '',
      password: map['password'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
