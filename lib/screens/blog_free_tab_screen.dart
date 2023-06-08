import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/screens/blog_free_detail_screen.dart';
import 'package:moonshine_fe/widgets/blog_free_tab_list_widget.dart';


class BlogFreeTabScreen extends StatefulWidget {
  final int type;
  const BlogFreeTabScreen({
    super.key,
    required this.type,
  });

  @override
  State<BlogFreeTabScreen> createState() => _BlogFreeTabScreenState();
}
class _BlogFreeTabScreenState extends State<BlogFreeTabScreen> {
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
            itemCount: snapshot.data!.length,
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
                  BlogFreeTabList(
                    id: snapshot.data![index]["id"]!,
                    content: snapshot.data![index]["content"],
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
