import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moonshine_fe/config.dart' as globals;

class CocktailApi {
  // static const baseUrl = 'http://3.135.207.29:3000';
  static final baseUrl = globals.baseUrl;

  static Future<List<Map<String, dynamic>>> getCocktailList() async {
    final response =
        await http.get(Uri.parse('$baseUrl/cocktails/${globals.userId}'));
    List<Map<String, dynamic>> cocktailList = [];
    if (response.statusCode == 200) {
      cocktailList = (jsonDecode(response.body) as List<dynamic>).cast();
    }
    print(cocktailList);
    return cocktailList;
  }

  static Future<Map<String, dynamic>> getDetail(int id) async {
    Map<String, dynamic> details = {};

    final prefResponse = await http
        .get(Uri.parse('$baseUrl/user/${globals.userId}/preference/update'));
    if (prefResponse.statusCode == 200) {
      var preference = jsonDecode(prefResponse.body);
      print(preference);
      globals.user_boozy = preference['boozy'].toDouble();
      globals.user_dry = preference['dry'].toDouble();
      globals.user_gentle = preference['gentle'].toDouble();
      globals.user_sweet = preference['sweet'].toDouble();
      globals.user_alcohol = preference['alcohol'].toDouble() / 10.0;
    }

    final response = await http
        .get(Uri.parse('$baseUrl/cocktails/${globals.userId}/get/$id'));

    if (response.statusCode == 200) {
      details = jsonDecode(response.body) as Map<String, dynamic>;
    }

    print(details);
    return details;
  }
}
