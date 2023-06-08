import 'package:flutter/material.dart';
import 'package:moonshine_fe/screens/blog_free_detail_screen.dart';
import 'package:moonshine_fe/screens/blog_free_tab_screen.dart';

class BlogFreeTabList extends StatelessWidget {
  final int id;
  final String content;

  const BlogFreeTabList({
    super.key,
    required this.id,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogFreeDetailScreen(
                  id: id,
                ),
              ),
            );
          },
          child: LayoutBuilder(builder: (context, constraints) {
            return Text(content);
          }),
        ));
  }
}
