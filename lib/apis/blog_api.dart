import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moonshine_fe/config.dart' as globals;

class BlogApi {
  static final baseUrl = '${globals.baseUrl}/blog';

  static Future<List<Map<String, dynamic>>> getBlogList(int type) async {
    final response = await http.get(Uri.parse('$baseUrl/$type'));
    List<Map<String, dynamic>> blogList = [];
    if (response.statusCode == 200) {
      blogList = (jsonDecode(response.body) as List<dynamic>).cast();
    }
    print(blogList);
    return blogList;
  }

  static Future<Map<String, dynamic>> getDetail(int type, int id) async {
    final response = await http.get(Uri.parse('$baseUrl/get/$type/$id'));
    Map<String, dynamic> detail = {};
    if (response.statusCode == 200) {
      detail = jsonDecode(response.body) as Map<String, dynamic>;
    }
    print(detail);
    return detail;
  }
}

class BlogDummyApi {
  static Future<List<Map<String, dynamic>>> getBarBlogList() async {
    List<Map<String, dynamic>> barBlogList = [];
    barBlogList.add({
      'thumb': 'assets/image/1.jpg',
      'title': 'BarBlogTitle1',
      'id': 0,
    });
    barBlogList.add({
      'thumb': 'assets/image/1.jpg',
      'title': 'BarBlogTitle2',
      'id': 1,
    });
    return barBlogList;
  }

  static Future<List<Map<String, dynamic>>> getCocktailBlogList() async {
    List<Map<String, dynamic>> cocktailBlogList = [];
    cocktailBlogList.add({
      'thumb': 'assets/image/2.jpg',
      'title': 'CocktailBlogTitle1',
      'id': 2,
    });
    cocktailBlogList.add({
      'thumb': 'assets/image/2.jpg',
      'title': 'CocktailBlogTitle2',
      'id': 3,
    });
    return cocktailBlogList;
  }

  static Future<List<Map<String, dynamic>>> getRecipeBlogList() async {
    List<Map<String, dynamic>> recipeBlogList = [];
    recipeBlogList.add({
      'thumb': 'assets/image/3.jpg',
      'title': 'RecipeBlogTitle1',
      'id': 4,
    });
    recipeBlogList.add({
      'thumb': 'assets/image/3.jpg',
      'title': 'RecipeBlogTitle2',
      'id': 5,
    });
    return recipeBlogList;
  }

  static Future<List<Map<String, dynamic>>> getFreeBlogList() async {
    List<Map<String, dynamic>> freeBlogList = [];
    freeBlogList.add({
      // 'thumb': 'assets/blogthumb.png',
      'title': 'FreeBlogTitle1',
      'id': 0,
    });
    freeBlogList.add({
      // 'thumb': 'assets/blogthumb.png',
      'title': 'FreeBlogTitle2',
      'id': 1,
    });
    return freeBlogList;
  }

  static Future<Map<String, dynamic>> getDetail(int id) async {
    Map<String, dynamic> detail = {};
    detail['title'] = 'DummyTitle123';
    detail['user'] = 'DummyUser123';
    detail['timestamp'] = '2023.06.08 04:49';
    detail['content'] =
        'DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123DummyContent123';
    return detail;
  }
}
