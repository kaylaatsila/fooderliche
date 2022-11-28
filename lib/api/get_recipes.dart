import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../models/models.dart';

class GetRecipe {
  static var URL = 'https://uji.fmipa.unila.ac.id/api-test/recipes.json';
  Future<List<SimpleRecipe>> getRecipes() async {
    var response = await Dio().get(URL);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = response.data;
      if (json['recipes'] != null) {
        final recipes = <SimpleRecipe>[];
        json['recipes'].forEach((v) {
          recipes.add(SimpleRecipe.fromJson(v));
        });
        return recipes;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  static Future getData() async {
    // Simulate api request wait time
    var response = await http.get(Uri.parse('https://uji.fmipa.unila.ac.id/api-test/recipes.json'));
    print(response.statusCode);
  }
}
