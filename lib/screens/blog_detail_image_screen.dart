import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/widgets/blog_detail_image_lists_widget.dart';
import 'package:moonshine_fe/widgets/blog_detail_image_widget.dart';

class BlogDetailImageScreen extends StatefulWidget {
  final int id, type;
  final Geolocation geolocation;
  const BlogDetailImageScreen({
    super.key,
    required this.id,
    required this.type,
    required this.geolocation,
  });

  @override
  State<BlogDetailImageScreen> createState() => _BlogDetailImageScreenState();
}

class _BlogDetailImageScreenState extends State<BlogDetailImageScreen> {
  late Future<Map<String, dynamic>> detail;
  @override
  void initState() {
    super.initState();
    // detail = BlogDummyApi.getDetail(widget.id);
    detail = BlogApi.getDetail(widget.type, widget.id);
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
                    // Image
                    BlogDetailImage(
                      imgList: snapshot.data!['images']!,
                    ),
                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            snapshot.data!['title'],
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontFamily,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                    BlogDetailImageLists(
                      type: widget.type,
                      detail: snapshot.data!,
                      geolocation: widget.geolocation,
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  '${widget.id}',
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
