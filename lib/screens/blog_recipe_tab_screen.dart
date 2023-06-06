import 'package:flutter/material.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';

class BlogRecipeTabScreen extends StatelessWidget {
  const BlogRecipeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const Center(
            child: Text('BlogRecipeTabScreen'),
          ),
        ),
        const BlogTabImageList(),
      ],
    );
  }
}
