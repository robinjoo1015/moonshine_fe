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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text('Blog'),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border_outlined),
                )
              ],
            ),
          ];
        },
        body: FutureBuilder(
          future: detail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //         horizontal: 20,
                    //         vertical: 10,
                    //       ),
                    //       child: Text(
                    //         // snapshot.data!['title'],
                    //         'Title',
                    //         style: TextStyle(
                    //           fontFamily: Theme.of(context)
                    //               .textTheme
                    //               .bodyLarge!
                    //               .fontFamily,
                    //           fontSize: 24,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // User
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            snapshot.data!['author'],
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            snapshot.data!['timestamp'].substring(0, 10) +
                                ' ' +
                                snapshot.data!['timestamp'].substring(11, 16),
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(snapshot.data!['content']),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );

    // FutureBuilder(
    //   future: detail,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return SingleChildScrollView(
    //           scrollDirection: Axis.vertical,
    //           physics: const ClampingScrollPhysics(),
    //           child: Column(
    //             children: [
    //               Text(snapshot.data!["content"]),
    //             ],
    //           )
    //       );
    //     } else {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // );
  }
}
