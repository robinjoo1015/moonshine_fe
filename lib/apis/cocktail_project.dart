import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class CocktailProject {
  static const baseUrl = 'https://www.thecocktailproject.com/';

  static Future<List<Map<String, String>>> getCocktailList() async {
    final response = await http.get(Uri.parse('$baseUrl/search-recipes/'));
    List<Map<String, String>> cocktailList = [];
    if (response.statusCode == 200) {
      // print(response.body);
      var document = parse(response.body);
      var elements = document.getElementsByClassName('item-image');
      for (var element in elements) {
        String imgTag = element.children[0].innerHtml;
        String src = imgTag.split('src="')[1].split('"')[0];
        String detailTag = element.children[1].innerHtml;
        String name = detailTag.split('href="')[1].split('"')[0].split('/')[1];
        cocktailList.add({'name': name, 'src': src});
        // print(cocktailList);
      }
      return cocktailList;
    } else {
      throw Error();
    }
  }

  static Future<Map<String, dynamic>> getDetail(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/$name'));
    Map<String, dynamic> details = {};
    List<String> imgList = [];
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var carousel = document.getElementsByClassName('carousel-inner');
      // print(carousel);
      for (var item in carousel.first.children) {
        // print(item.innerHtml);
        imgList.add(item.children[0].innerHtml.split('src="')[1].split('"')[0]);
      }
      details['imgList'] = imgList;
      return details;
    }
    throw Error();
  }
}
