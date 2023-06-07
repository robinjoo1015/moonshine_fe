import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';

class BlogCocktailTabScreen extends StatelessWidget {
  BlogCocktailTabScreen({super.key});
  final Future<List<Map<String, dynamic>>> cocktailBlogList =
      BlogDummyApi.getCocktailBlogList();

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
