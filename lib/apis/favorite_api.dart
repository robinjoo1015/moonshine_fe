import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moonshine_fe/config.dart' as globals;

class FavoriteApi {
  static Future<bool> toggleBarFavorite(int barId) async {
    final response = await http.get(
        Uri.parse('${globals.baseUrl}/bars/${globals.userId}/update/$barId'));
    print(response.statusCode);
    var result = jsonDecode(response.body);
    print(result['is_favorite']);
    if (response.statusCode == 200) {
      return result['is_favorite'];
    } else {
      return false;
    }
  }
}
