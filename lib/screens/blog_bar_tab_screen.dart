import 'package:flutter/material.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';

class BlogBarTabScreen extends StatelessWidget {
  const BlogBarTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const Center(
            child: Text('BlogBarTabScreen'),
          ),
        ),
        const BlogTabImageList(),
      ],
    );
  }
}
