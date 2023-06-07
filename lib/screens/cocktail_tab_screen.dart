import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/widgets/cocktail_tab_item_widget.dart';
import 'package:searchfield/searchfield.dart';

class CocktailTabScreen extends StatelessWidget {
  final Geolocation geolocation;
  CocktailTabScreen({
    super.key,
    required this.geolocation,
  });
  // https://www.thecocktailproject.com/search-recipes/
  // final Future<List<Map<String, String>>> cocktailList =
  //     CocktailProject.getCocktailList();
  final Future<List<Map<String, dynamic>>> cocktailList =
      CocktailApi.getCocktailList();

  // CocktailDAO cocktailDAO = CocktailDAO();
  // final Future<List<Map<String, String>>> cocktailList =
  // CocktailDAO.getCocktailForCocktailScreen();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cocktailList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<String> names = [];
          for (var item in snapshot.data!) {
            names.add(item['name']!);
          }
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
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 40,
                          child: Center(child: Text('이름순')),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: SearchField(
                              itemHeight: 40,
                              maxSuggestionsInViewPort: 8,
                              focusNode: FocusNode(
                                skipTraversal: true,
                              ),
                              suggestionState: Suggestion.hidden,
                              suggestionAction: SuggestionAction.unfocus,
                              scrollbarAlwaysVisible: false,
                              searchInputDecoration: const InputDecoration(
                                // icon: Icon(Icons.search_outlined),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                              suggestions: names
                                  .map(
                                    (name) => SearchFieldListItem(
                                      name,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(name),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.search_outlined,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CocktailTabItem(
                          id: snapshot.data![0]['id']!,
                          imgUrl: snapshot.data![0]['url']!,
                          name: snapshot.data![0]['name']!,
                          geolocation: geolocation,
                        ),
                        CocktailTabItem(
                          id: snapshot.data![1]['id']!,
                          imgUrl: snapshot.data![1]['url']!,
                          name: snapshot.data![1]['name']!,
                          geolocation: geolocation,
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CocktailTabItem(
                    id: snapshot.data![index * 2]['id']!,
                    imgUrl: snapshot.data![index * 2]['url']!,
                    name: snapshot.data![index * 2]['name']!,
                    geolocation: geolocation,
                  ),
                  CocktailTabItem(
                    id: snapshot.data![index * 2 + 1]['id']!,
                    imgUrl: snapshot.data![index * 2 + 1]['url']!,
                    name: snapshot.data![index * 2 + 1]['name']!,
                    geolocation: geolocation,
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
