import 'dart:convert';

import 'package:clothing_app_ui/core/api/api.dart';
import 'package:clothing_app_ui/features/home/categories/model/categories_model.dart';
import 'package:http/http.dart' as http;

class CategoriesRepo {
  Future<List<CategoriesModel>> getCategories() async {
    try {
      final response = await http.get(Uri.parse("${Api.apiUrl}/categories"));
      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (data as List).map((e) => CategoriesModel.fromJson(e)).toList();
      }
      throw data.toString();
    } catch (e) {
      rethrow;
    }
  }
}
