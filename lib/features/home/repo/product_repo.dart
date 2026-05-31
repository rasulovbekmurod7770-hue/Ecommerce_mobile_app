import 'dart:convert';

import 'package:clothing_app_ui/core/api/api.dart';
import 'package:clothing_app_ui/features/product%20page/model/products_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<ProductModel>> getProducts() async {
    final storage = const FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    try {
      final headers = {'accept': 'application/json'};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        print("token is here $token");
      }
      final response = await http.get(
        Uri.parse("${Api.apiUrl}/products"),
        headers: headers,
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (data as List).map((e) => ProductModel.fromJson(e)).toList();
      }
      throw data.toString();
    } catch (e) {
      rethrow;
    }
  }

  
}