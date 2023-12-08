import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft/constants/global_variables.dart';

void addToCart({required String name,required String price,required String quantity,required String imageUrl}) async{

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('x-auth-token');

  http.Response response = await http.post(Uri.parse('$uri/users/cart'),
    headers: <String,String>{
      "Content-Type":"application/json; charset=UTF-8"
    },
    body: jsonEncode({
      "name":name,
      "price":price,
      "quantity":quantity,
      "token":token,
      "imageUrl":imageUrl
    })
  );
}


Future<Map<dynamic,dynamic>> getCartItems() async{

  try{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    http.Response response = await http.get(Uri.parse("$uri/users/cart/products"),
        headers: <String,String>{
          "token": sharedPreferences.getString('x-auth-token')!,
          "Content-Type": "application/json; charset=UTF-8"
        }
    );
    var data = jsonDecode(response.body);
    return data;

  }catch(e){
    print(e);
    return {};
  }
}

Future<void> updateCartItemCount({required String name,required int count})async{
  try{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    http.Response response = await http.put(Uri.parse("$uri/users/cart/products"),
        headers: <String,String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
      body: jsonEncode({
        "token": sharedPreferences.getString('x-auth-token'),
        "name": name,
        "count":count
        })
    );
  }catch(e){
    print(e);
  }
}

Future<void> deleteCartItem({required String name}) async{
  try{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    http.Response response = await http.delete(Uri.parse("$uri/users/cart/products"),
        headers: <String,String>{
          "Content-Type": "application/json; charset=UTF-8",
          "token": sharedPreferences.getString('x-auth-token')!,
          "name": name
        }
    );
  }catch(e){
    print(e);
  }
}