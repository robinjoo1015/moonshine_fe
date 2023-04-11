import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import '../widgets/recipe_tab_menu_widget.dart';

class GetHttp {
  static const baseUrl = "https://www.thecocktailproject.com/search-recipes/";
  static Future<List<Map<String, String>>> getCocktailList() async {
    final response = await http.get(Uri.parse(baseUrl));
    List<Map<String, String>> cocktailList = [];
    if (response.statusCode == 200) {
      // print(response.body);
      var document = parse(response.body);
      var elements = document.getElementsByClassName("item-image");
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
}

class RecipeTabScreen extends StatelessWidget {
  RecipeTabScreen({super.key});
  // https://www.thecocktailproject.com/search-recipes/
  final Future<List<Map<String, String>>> cocktailList =
      GetHttp.getCocktailList();
  final baseUrl = "https://www.thecocktailproject.com/";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cocktailList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length ~/ 2,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 0,
              );
            },
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RecipeTabMenu(
                    imgUrl: snapshot.data![index * 2]['src']!,
                    name: snapshot.data![index * 2]['name']!,
                  ),
                  RecipeTabMenu(
                    imgUrl: snapshot.data![index * 2 + 1]['src']!,
                    name: snapshot.data![index * 2 + 1]['name']!,
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
