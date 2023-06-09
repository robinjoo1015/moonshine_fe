import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

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

  static Future<List<Map<String, dynamic>>> getFreeBlogList() async {
    final response = await http.get(Uri.parse('$baseUrl/4'));
    List<Map<String, dynamic>> detail = [];
    if (response.statusCode == 200) {
      detail = (jsonDecode(response.body) as List<dynamic>).cast();
    }
    print(detail);
    return detail;
  }

  static Future<Map<String, dynamic>> getFreeBlogDetails(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/get/4/$id'));
    Map<String, dynamic> detail = {};
    if (response.statusCode == 200) {
      detail = jsonDecode(response.body) as Map<String, dynamic>;
    }
    print(detail);
    return detail;
  }

  static Future<String> createImage(List<String> pathList) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${globals.baseUrl}/images/upload'));

    for (var path in pathList) {
      // var path = pathList[0];
      var file = File(path);
      var stream = http.ByteStream(file.openRead());
      stream.cast();
      var length = await file.length();

      var multipartFile = http.MultipartFile(
        'file',
        stream,
        length,
        filename: basename(file.path),
      );
      // print(basename(file.path));
      request.files.add(multipartFile);
    }
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    // var response = await streamedResponse.stream.bytesToString();
    // print(response.stream);
    // print(response.contentLength);
    // print(response.headers);
    // print(response.isRedirect);
    // print(response.persistentConnection);
    // print(response.reasonPhrase);
    // print(response.request);
    // print(streamedResponse.statusCode);
    if (response.statusCode == 200) {
      // print(response.stream);
      print(response.body);
      // print(jsonDecode(response.body));
      // print(response);

      // return streamedResponse.statusCode;
      return response.body;
    } else {
      return '';
    }
  }

  static Future<dynamic> createPost(
      int type, Map<String, dynamic> postData) async {
    // final userId = globals.userId;
    postData['userId'] = globals.userId.toString();
    print(json.encode(postData));
    print(type);
    var response = await http.post(
      Uri.parse('$baseUrl/${type.toString()}/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(postData),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      // if (decode['status'] == 200) {
      print(decode.toString());
      // }
      return decode;
    } else {
      return -1;
    }
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
