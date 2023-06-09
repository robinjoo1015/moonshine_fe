import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/blog_api.dart';
import 'package:moonshine_fe/screens/blog_free_detail_screen.dart';
import 'package:moonshine_fe/screens/blog_free_post_screen.dart';
import 'package:moonshine_fe/config.dart' as globals;

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
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.black26,
                            child: const SizedBox(
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlogFreeDetailScreen(
                                    id: snapshot.data![index]["id"]!,
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 50,
                              child: Text(
                                snapshot.data![index]["content"]!.length > 40
                                    ? '${snapshot.data![index]["content"]!.substring(0, 40)}...'
                                    : snapshot.data![index]["content"]!,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
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
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BlogFreePostScreen(
                                          type: widget.type,
                                        ),
                                      ),
                                    );
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
