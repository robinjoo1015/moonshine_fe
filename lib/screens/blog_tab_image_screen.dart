import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/screens/blog_post_screen.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';
import 'package:moonshine_fe/config.dart' as globals;

class BlogTabImageScreen extends StatefulWidget {
  final int type;
  final Geolocation geolocation;
  const BlogTabImageScreen({
    super.key,
    required this.type,
    required this.geolocation,
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
          return Stack(
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: (snapshot.data!.length + 1) ~/ 2,
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
                        geolocation: widget.geolocation,
                      ),
                      BlogTabImageList(
                        id: (index * 2 + 1 == snapshot.data!.length)
                            ? -1
                            : snapshot.data![index * 2 + 1]['id']!,
                        imgUrl: (index * 2 + 1 == snapshot.data!.length)
                            ? ''
                            : snapshot.data![index * 2 + 1]['url'],
                        name: (index * 2 + 1 == snapshot.data!.length)
                            ? ''
                            : snapshot.data![index * 2 + 1]['title'],
                        type: widget.type,
                        geolocation: widget.geolocation,
                      ),
                    ],
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (globals.userId == 1)
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.all(30),
                              child: SizedBox(
                                width: 120,
                                height: 50,
                                child: GestureDetector(
                                  onTap: () async {
                                    final blogId = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlogPostScreen(
                                          type: widget.type,
                                        ),
                                      ),
                                    );
                                    print('New blogId = $blogId');
                                    blogList = BlogApi.getBlogList(widget.type);
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade700,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.edit_document,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '글 작성하기',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              )
            ],
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
