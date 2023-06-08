import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';

@override

class BlogFreeDetailScreen extends StatefulWidget {
  final int id;

  const BlogFreeDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<BlogFreeDetailScreen> createState() => _BlogFreeDetailScreen();
}

class _BlogFreeDetailScreen extends State<BlogFreeDetailScreen> {
  late Future<Map<String, dynamic>> detail;

  @override
  void initState() {
    super.initState();
    // detail = DiffordsGuide.getDetail(widget.id);
    detail = BlogApi.getFreeBlogDetails(widget.id);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: detail,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Text(snapshot.data!["content"]),
                ],
              )
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
