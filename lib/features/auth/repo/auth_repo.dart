import 'dart:convert';

import 'package:clothing_app_ui/features/auth/models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final String baseUrl = "http://45.130.148.176:8000/docs#";
   Future<AuthModel> createUser(AuthModel user) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/Authentication/signup_auth_signup_post"),
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
        },
        body: jsonEncode(user.toJson()),
      );
      final Map data = jsonDecode(response.body);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw data.toString();
      }
      return AuthModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}