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
    List<String> ingredientImgList = [];
    List<String> ingredientList = [];
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var carousel = document.getElementsByClassName('carousel-inner');
      // print(carousel);
      for (var item in carousel.first.children) {
        // print(item.innerHtml);
        imgList.add(item.children[0].innerHtml.split('src="')[1].split('"')[0]);
      }
      details['imgList'] = imgList;
      var ingredientGallery = document.getElementsByClassName(
          "row justify-content-center no-gutters desktop-only");
      for (var item in ingredientGallery.first.children) {
        ingredientImgList
            .add(item.children[0].innerHtml.split('src="')[1].split('"')[0]);
        ingredientList
            .add(item.children[0].innerHtml.split('alt="')[1].split('"')[0]);
      }
      details['ingredientImgList'] = ingredientImgList;
      details['ingredientList'] = ingredientList;
      return details;
    }
    throw Error();
  }
}

class DiffordsGuide {
  static const baseUrl = 'https://www.diffordsguide.com';

  static Future<List<Map<String, String>>> getBarList() async {
    final response = await http.get(Uri.parse('$baseUrl/pubs-and-bars'));
    List<Map<String, String>> barList = [];
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var elements =
          document.getElementsByClassName('cell small-6 medium-3 large-2 box');
      // print(elements);
      for (var item in elements) {
        String imgUrl =
            item.children[0].innerHtml.split('src="')[1].split('"')[0];
        String name = item.children[1].innerHtml;
        // print(name);
        // print(item.outerHtml);
        // String url = item.outerHtml.split('href="')[1].split('"')[0];
        String url = item.attributes['href']!;
        // print(url);
        barList.add({'name': name, 'imgUrl': imgUrl, 'url': url});
      }
      return barList;
    } else {
      throw Error();
    }
  }

  static Future<Map<String, dynamic>> getDetail(String url) async {
    final response = await http.get(Uri.parse('$baseUrl$url'));
    // print(Uri.parse('$baseUrl$url'));
    Map<String, dynamic> details = {};
    List<String> imgList = [];
    if (response.statusCode == 200) {
      var document = parse(response.body);
      var inner = document
          .getElementsByClassName('cell large-8 medium-9 small-12 notch')[0]
          .getElementsByClassName('grid-x grid-margin-x')[0];
      // print(inner.innerHtml);
      var img = inner.getElementsByTagName('img');
      for (var item in img) {
        imgList.add(item.attributes['src']!);
        // print(item.attributes['src']);
      }
      // print(inner.getElementsByClassName('cell auto')[0].children[0].innerHtml);
      var infolist = inner.getElementsByClassName('cell auto')[0].children[0];
      String address =
          infolist.innerHtml.split('</strong>')[1].split('<br>')[0].trim();
      String tel =
          infolist.innerHtml.split('</strong>')[2].split('<br>')[0].trim();
      String hours =
          infolist.innerHtml.split('</strong>')[5].split('<br>')[0].trim();
      // print(address);
      // print(tel);
      // print(hours);
      details['imgList'] = imgList;
      details['address'] = address;
      details['tel'] = tel;
      details['Hours'] = hours;
    } else {
      throw Error();
    }
    return details;
  }
}
