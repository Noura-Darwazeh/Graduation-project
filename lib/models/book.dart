// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Book> bookFromJson(String str) =>
    List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
  Book({
    this.id,
    required this.salonid,
    required this.userId,
    required this.bookDate,
    required this.owner,
    required this.startbook,
    required this.endbook,
    required this.nbrpersone,
    required this.accepted,
    required this.service,
    required this.phone,
    required this.username,
  });

  String? id;
  String userId, salonid;
  DateTime bookDate;
  String owner;
  String username;
  String startbook;
  String endbook;
  int nbrpersone;
  bool accepted;
  String service;
  String phone;

  factory Book.fromJson(Map<String, dynamic> json) {
    print(json);
    return Book(
      id: json["_id"],
      username: json["username"],
      owner: json["owner"],
      salonid: json["salonid"],
      userId: json["userId"],
      bookDate: DateTime.parse(json["bookDate"]),
      startbook: json["startbook"],
      endbook: json["endbook"],
      nbrpersone: json["nbrpersone"],
      accepted: json["accepted"],
      service: json["service"],
      phone: json["phone"],
    );
  }

  Map<String, dynamic> toJson() => {
        "salonid": salonid,
        "_id": id,
        "owner": owner,
        "username": username,
        "userId": userId,
        "bookDate": bookDate.toIso8601String(),
        "startbook": startbook,
        "endbook": endbook,
        "nbrpersone": nbrpersone,
        "accepted": accepted,
        "service": service,
        "phone": phone,
      };
}
