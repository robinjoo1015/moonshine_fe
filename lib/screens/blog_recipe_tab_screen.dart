import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';

class BlogRecipeTabScreen extends StatelessWidget {
  BlogRecipeTabScreen({super.key});
  final Future<List<Map<String, dynamic>>> recipeBlogList =
      BlogDummyApi.getRecipeBlogList();

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
