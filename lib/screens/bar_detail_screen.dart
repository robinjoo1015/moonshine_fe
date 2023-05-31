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
        // ***메뉴***+별점, 리뷰/블로그
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
                    // Name, Rating
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
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.star,
                                size: 16,
                                // color: Colors.yellow,
                              ),
                              Text(
                                '4.8 / 5.0',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Address
                    const SizedBox(
                      height: 10,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            "주소",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontFamily,
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black38,
                            thickness: 1,
                          ),
                          Expanded(
                            child: Text(
                              snapshot.data!['address'],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    // ***MAP***
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: SizedBox(
                        height: 120,
                        child: Container(
                          color: Colors.green,
                          child: const Center(
                            child: Text('MAP'),
                          ),
                        ),
                      ),
                    ),
                    // Tel
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                            // height: 20,
                          ),
                          Text(
                            '전화번호',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontFamily,
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black38,
                            thickness: 1,
                          ),
                          Text(snapshot.data!['tel']),
                          const SizedBox(
                            width: 20,
                            // height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Hours
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                            // height: 20,
                          ),
                          Text(
                            '영업시간',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontFamily,
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black38,
                            thickness: 1,
                          ),
                          Text(snapshot.data!['hours']),
                          const SizedBox(
                            width: 20,
                            // height: 20,
                          ),
                        ],
                      ),
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