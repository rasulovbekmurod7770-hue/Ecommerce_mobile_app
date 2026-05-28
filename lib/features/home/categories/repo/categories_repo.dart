import 'dart:convert';

import 'package:clothing_app_ui/core/api/api.dart';
import 'package:clothing_app_ui/features/home/categories/model/categories_model.dart';
import 'package:http/http.dart' as http;

class CategoriesRepo {
  Future<List<CategoriesModel>> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse("${Api.apiUrl}/categories"),
        headers: {"Accept": "application/json"},
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200 && response.statusCode != 201) {
        print("201 or 200");
        throw data.toString();
      }
      return (data as List).map((e) => CategoriesModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}