import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class getHttp {
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
        print(cocktailList);
      }
      return cocktailList;
    } else {
      throw Error();
    }
  }
}

class RecipeScreen extends StatelessWidget {
  RecipeScreen({super.key});
  // https://www.thecocktailproject.com/search-recipes/
  final Future<List<Map<String, String>>> cocktailList =
      getHttp.getCocktailList();
  final baseUrl = "https://www.thecocktailproject.com/";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cocktailList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          return Container(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length ~/ 2,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              baseUrl + snapshot.data![index * 2]['src']!,
                            ),
                            Text(snapshot.data![index * 2]['name']!),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              baseUrl + snapshot.data![index * 2 + 1]['src']!,
                            ),
                            Text(snapshot.data![index * 2 + 1]['name']!),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
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
