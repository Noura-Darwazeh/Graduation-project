import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soft/constants/global_variables.dart';
import 'package:soft/models/book.dart';
import 'package:soft/models/salonmodel.dart';

class Booking {
  static Future<void> addBook(Map<String, dynamic> json) async {
    print(json);
    var res = await http.post(Uri.parse("$uri/books/book"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(json));
    print(res.statusCode);
  }

  static Future<String> getallBooks() async {
    print(json);
    var res = await http.get(
      Uri.parse("$uri/books/getbooks"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return res.body;
  }

  static Future<List<Book>> getallBookbyowner(owner) async {
    print(owner);
    var res = await http.get(
      Uri.parse("$uri/books/getbook"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'owner': owner,
      },
    );

    return bookFromJson(res.body);
  }
}
