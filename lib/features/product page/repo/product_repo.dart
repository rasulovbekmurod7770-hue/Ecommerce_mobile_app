import 'dart:convert';

import 'package:clothing_app_ui/core/api/api.dart';
import 'package:clothing_app_ui/features/product%20page/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse("${Api.apiUrl}/products"),
        headers: {"Accept": "application/json"},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200 && response.statusCode != 201) {
        
        throw data.toString();
      }
      return (data as List).map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}