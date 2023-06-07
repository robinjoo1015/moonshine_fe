import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';

class BlogTabImageScreen extends StatefulWidget {
  final int type;
  const BlogTabImageScreen({
    super.key,
    required this.type,
  });

  @override
  State<BlogTabImageScreen> createState() => _BlogTabImageScreenState();
}

class _BlogTabImageScreenState extends State<BlogTabImageScreen> {
  late Future<List<Map<String, dynamic>>> blogList;

  @override
  void initState() {
    super.initState();
    blogList = BlogApi.getBlogList(widget.type);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: blogList,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length ~/ 2,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 0,
              );
            },
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlogTabImageList(
                    id: snapshot.data![index * 2]['id']!,
                    imgUrl: snapshot.data![index * 2]['url'],
                    name: snapshot.data![index * 2]['title'],
                    type: widget.type,
                  ),
                  BlogTabImageList(
                    id: snapshot.data![index * 2 + 1]['id']!,
                    imgUrl: snapshot.data![index * 2 + 1]['url'],
                    name: snapshot.data![index * 2 + 1]['title'],
                    type: widget.type,
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
