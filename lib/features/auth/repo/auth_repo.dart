import 'dart:convert';

import 'package:clothing_app_ui/features/auth/model/auth_token_model.dart';
import 'package:clothing_app_ui/features/auth/sign_in/models/sign_in_model.dart';
import 'package:clothing_app_ui/features/auth/sign_up/models/sign_up_model.dart';
import 'package:clothing_app_ui/features/auth/sign_up/models/user_dto.dart';
import 'package:clothing_app_ui/features/auth/tell_us_abt_yourelf/model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final String baseUrl = "http://45.130.148.176:8000";
  Future<UserModel> createUser(SignUpModel user) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/signup"),
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
        },
        body: jsonEncode(user.toJson()),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw data.toString();
      }
      return UserModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token != null && token.isNotEmpty;
  }

  Future<void> login(SignInModel dto) async {
    final storage = const FlutterSecureStorage();

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/auth/login"),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(dto.toJson()),
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = AuthTokenModel.fromJson(data).token;
        await storage.write(key: 'token', value: token);
        return;
      }

      throw data.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getDetails(int userId, UserDto dto) async {
    try {
      final response = await http.patch(
        Uri.parse("$baseUrl/auth/complete-profile/$userId"),
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
        },
        body: jsonEncode(dto.toJson()),
      );
      final Map data = jsonDecode(response.body);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw data.toString();
      }
      return UserModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
