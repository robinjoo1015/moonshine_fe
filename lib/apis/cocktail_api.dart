import 'dart:convert';

import 'package:http/http.dart' as http;

class CocktailApi {
  static const baseUrl = 'http://3.135.207.29:3000';

  static Future<List<Map<String, dynamic>>> getCocktailList() async {
    final response = await http.get(Uri.parse('$baseUrl/cocktails'));
    List<Map<String, dynamic>> cocktailList = [];
    if (response.statusCode == 200) {
      cocktailList = (jsonDecode(response.body) as List<dynamic>).cast();
    }
    return cocktailList;
  }

  static Future<Map<String, dynamic>> getDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/cocktails/get/$id'));
    Map<String, dynamic> details = {};
    if (response.statusCode == 200) {
      details = jsonDecode(response.body) as Map<String, dynamic>;
    }
    // print(details);
    return details;
  }
}
