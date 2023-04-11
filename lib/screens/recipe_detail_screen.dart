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
      appBar: AppBar(
        title: Text(
          name,
        ),
        elevation: 2,
      ),
      body: Container(
        child: Center(
          child: Text(
            name,
          ),
        ),
      ),
    );
  }
}
