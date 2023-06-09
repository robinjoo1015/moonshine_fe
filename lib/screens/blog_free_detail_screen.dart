import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/config.dart' as globals;

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
  static final baseUrl = "${globals.baseUrl}/blog/4/";
  TextEditingController myController = TextEditingController();
  String content = '';
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<String?> uploadcontent() async {
    final response = await http.post(
      Uri.parse('$baseUrl/create/${widget.id}'),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({
        "id": globals.userId,
        "content": content,
      }),
    );
    return null;
  }

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('Blog'),
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                actions: const [
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.bookmark_border_outlined),
                  // )
                ],
              ),
            ];
          },
          body: FutureBuilder(
            future: detail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: () async {
                    setState(() {
                      detail = BlogApi.getFreeBlogDetails(widget.id);
                    });
                  },
                  child: Stack(
                    children: [
                      SingleChildScrollView(
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
                                    snapshot.data!['timestamp']
                                            .substring(0, 10) +
                                        ' ' +
                                        snapshot.data!['timestamp']
                                            .substring(11, 16),
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
                            Container(
                              height: 6,
                              color: Colors.grey,
                            ),
                            for (var comment in snapshot.data![
                                'comments']) // Assuming 'comments' is the correct key
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          child: Text(
                                            comment[
                                                'author'], // Assuming 'author' is the correct key
                                            style: TextStyle(
                                              fontFamily: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .fontFamily,
                                              fontSize: 15,
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
                                            comment['timestamp']
                                                    .substring(0, 10) +
                                                ' ' +
                                                comment['timestamp'].substring(
                                                    11,
                                                    16), // Assuming 'timestamp' is the correct key
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(comment[
                                                'content']), // Assuming 'content' is the correct key
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      Container(),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: myController,
                                maxLines: 2,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Comment',
                                ),
                              ),
                            ),
                            FloatingActionButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    content = myController.text;
                                    uploadcontent();
                                    myController.clear();
                                    _refreshIndicatorKey.currentState?.show();
                                  });
                                },
                                child: const Icon(Icons.send)),
                          ],
                        ),
                      )
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
