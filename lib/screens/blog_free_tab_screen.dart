import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';

class BlogFreeTabScreen extends StatelessWidget {
  BlogFreeTabScreen({super.key});
  final Future<List<Map<String, dynamic>>> freeBlogList =
      BlogDummyApi.getFreeBlogList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('BlogFreeTabScreen'),
      ),
    );
  }
}
