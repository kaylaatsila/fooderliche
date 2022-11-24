import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../models/explore_recipe.dart';

class GetRecipe {
  static var URL = 'https://uji.fmipa.unila.ac.id/api-test/recipes.json';
  Future<List<SimpleRecipe>> getRecipes() async {
    var response = await http.get(Uri.parse('https://uji.fmipa.unila.ac.id/api-test/recipes.json'));
    if (response.statusCode == 200) {
      // var data = json.decode(response.body);
      final Map<String, dynamic> json = jsonDecode(response.body);
      // Go through each recipe and convert json to SimpleRecipe object.
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
