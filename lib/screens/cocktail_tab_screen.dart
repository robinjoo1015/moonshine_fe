import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';
import 'package:moonshine_fe/widgets/cocktail_tab_item_widget.dart';

class CocktailTabScreen extends StatelessWidget {
  CocktailTabScreen({super.key});
  // https://www.thecocktailproject.com/search-recipes/
  final Future<List<Map<String, String>>> cocktailList =
      CocktailProject.getCocktailList();
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
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 0,
              );
            },
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: const [
                    SizedBox(
                      height: 40,
                      child: Text('Search'),
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CocktailTabItem(
                    imgUrl: snapshot.data![index * 2]['src']!,
                    name: snapshot.data![index * 2]['name']!,
                  ),
                  CocktailTabItem(
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
