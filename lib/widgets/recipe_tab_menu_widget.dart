import 'package:flutter/material.dart';
import 'package:moonshine_fe/screens/recipe_detail_screen.dart';

class RecipeTabMenu extends StatelessWidget {
  final baseUrl = "https://www.thecocktailproject.com/";
  final String imgUrl, name;
  const RecipeTabMenu({
    super.key,
    required this.imgUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.loose,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailScreen(name: name),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          child: Column(
            children: [
              Image.network(
                baseUrl + imgUrl,
              ),
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}
