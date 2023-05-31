import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';
import 'package:moonshine_fe/widgets/bar_detail_image_widget.dart';

class BarDetailScreen extends StatefulWidget {
  final String name, url;
  const BarDetailScreen({
    super.key,
    required this.name,
    required this.url,
  });

  @override
  State<BarDetailScreen> createState() => _BarDetailScreenState();
}

class _BarDetailScreenState extends State<BarDetailScreen> {
  late Future<Map<String, dynamic>> detail;

  @override
  void initState() {
    super.initState();
    detail = DiffordsGuide.getDetail(widget.url);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(widget.name),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border_outlined),
                ),
              ],
            ),
          ];
        },
        // 사진, 이름, 기본정보(주소, 영업시간), ***지도(작게)***, ***메뉴***+별점, 리뷰/블로그
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
                    BarDetailImage(imgList: snapshot.data!['imgList']),
                    // Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            widget.name,
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
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  widget.name,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
