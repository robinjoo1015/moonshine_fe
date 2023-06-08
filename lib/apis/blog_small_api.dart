import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moonshine_fe/config.dart' as globals;

class BarApi {
  // static const baseUrl = 'http://3.135.207.29:3000';
  static final baseUrl = '${globals.baseUrl}/blog';

  static Future<List<Map<String, dynamic>>> getBlogList() async {
    final response = await http.get(Uri.parse('$baseUrl/4'));
    List<Map<String, dynamic>> blogList = [];
    if (response.statusCode == 200) {
      blogList = (jsonDecode(response.body) as List<dynamic>).cast();
    }
    print(blogList);
    return blogList;
  }

  static Future<Map<String, dynamic>> getDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/get/4/$id'));
    Map<String, dynamic> detail = {};
    if (response.statusCode == 200) {
      detail = jsonDecode(response.body) as Map<String, dynamic>;
    }
    print(detail);
    return detail;
  }
}
