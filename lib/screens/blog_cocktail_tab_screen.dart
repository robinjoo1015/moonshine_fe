import 'package:flutter/material.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';

class BlogCocktailTabScreen extends StatelessWidget {
  const BlogCocktailTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const Center(
            child: Text('BlogCocktailTabScreen'),
          ),
        ),
        const BlogTabImageList(),
      ],
    );
  }
}
