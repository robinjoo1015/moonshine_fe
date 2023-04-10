import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});
  // final List<Map<String, String>> RecipeList = [];
  // https://www.thecocktailproject.com/search-recipes/
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
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
                        "https://www.thecocktailproject.com/sites/default/files/styles/grid-thumb/public/EspressoMartini.jpg?itok=161L5upy",
                      ),
                      const Text(
                        'Espresso Martini',
                      ),
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
                        "https://www.thecocktailproject.com/sites/default/files/styles/grid-thumb/public/French75.jpg?itok=hn6XEc65",
                      ),
                      const Text(
                        'French 75',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
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
                        "https://www.thecocktailproject.com/sites/default/files/styles/grid-thumb/public/LastWord.jpg?itok=DFz5totk",
                      ),
                      const Text(
                        'Last Word',
                      ),
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
                        "https://www.thecocktailproject.com/sites/default/files/styles/grid-thumb/public/TomColins.jpg?itok=Vh6_KeE9",
                      ),
                      const Text(
                        'Tom Collins',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
