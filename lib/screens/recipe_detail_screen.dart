import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final String name;
  const RecipeDetailScreen({
    super.key,
    required this.name,
  });

  final baseUrl = "https://www.thecocktailproject.com/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(name),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
            )
          ];
        },
        body: Container(
          child: Center(
            child: Text(
              name,
            ),
          ),
        ),
      ),
    );
  }
}
