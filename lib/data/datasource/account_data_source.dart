import 'dart:convert';

import 'package:sottie_with_besties/core/utils/api_util.dart';
import 'package:sottie_with_besties/data/model/signup_model.dart';

import '../model/login_model.dart';
import 'package:http/http.dart' as http;

class AccountDataSource {
  Future<void> logIn(LogIn logIn) async {
    final response = await http.post(
        Uri.parse("${ApiUtil.BASE_URL}/sottie/users/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(logIn.toJson()));

    if (response.statusCode != 201) {
      throw Exception("Failed to send data");
    }
  }

  Future<void> signUp(SignUp signUp) async {
    final response = await http.post(
        Uri.parse("${ApiUtil.BASE_URL}/sottie/signup/users"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(signUp.toJson()));

    if (response.statusCode != 201) {
      throw Exception("Failed to send data");
    }
  }
}
