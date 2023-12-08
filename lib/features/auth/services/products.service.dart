import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soft/constants/global_variables.dart';

Future<List<dynamic>> getCentreProducts({ required String centreName }) async{
  try{
    http.Response response = await http.get(Uri.parse("$uri/products/centreProducts"),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'centreName':centreName
      }
    );

    return response.statusCode == 200 ? List.from(jsonDecode(response.body)) : [];
  }catch(e){
    print(e);
    return [];
  }
}