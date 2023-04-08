import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Text('Recipe 1'),
          Text('Recipe 2'),
        ],
      ),
    );
  }
}
