import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';

Future<List<dynamic>> getCentres() async {
  try {
    http.Response response =
        await http.get(Uri.parse("$uri/centres"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });

    var centres = List.from(json.decode(response.body));

    return centres;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<List<dynamic>> getCentresbyname(name) async {
  try {
    http.Response response = await http.get(
      Uri.parse("$uri/getcentres"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'name': name
      },
    );

    var centres = List.from(json.decode(response.body));

    return centres;
  } catch (e) {
    print(e);
    return [];
  }
}
