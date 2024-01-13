import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sottie_with_besties/account/signin/model/login_model.dart';

import 'package:sottie_with_besties/account/signup/model/signup_model.dart';


Future<void> logIn(LogIn logIn) async {
  try {
    final response = await http.post(
      Uri.parse("http://localhost:8080/sottie/users/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(logIn.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception("Failed to send data");
    } else {
      print("User Data sent successfully");
    }
  } catch (e) {
    print("Failed to send post data: ${e}");
  }
}