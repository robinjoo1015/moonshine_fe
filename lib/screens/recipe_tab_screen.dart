import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';

import '../widgets/recipe_tab_menu_widget.dart';

class RecipeTabScreen extends StatelessWidget {
  RecipeTabScreen({super.key});
  // https://www.thecocktailproject.com/search-recipes/
  final Future<List<Map<String, String>>> cocktailList =
      CocktailProject.getCocktailList();
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
