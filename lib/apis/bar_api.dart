import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moonshine_fe/config.dart' as globals;

class BarApi {
  // static const baseUrl = 'http://3.135.207.29:3000';
  static final baseUrl = '${globals.baseUrl}/bars';

  static Future<List<Map<String, dynamic>>> getBarList() async {
    final response = await http.get(Uri.parse(baseUrl));
    List<Map<String, dynamic>> barList = [];
    if (response.statusCode == 200) {
      barList = (jsonDecode(response.body) as List<dynamic>).cast();
    }
    print(barList);
    return barList;
  }

  static Future<Map<String, dynamic>> getDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/get/$id'));
    Map<String, dynamic> detail = {};
    if (response.statusCode == 200) {
      detail = jsonDecode(response.body) as Map<String, dynamic>;
    }
    print(detail);
    return detail;
  }
}
