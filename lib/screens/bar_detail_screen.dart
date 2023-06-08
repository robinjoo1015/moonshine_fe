import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moonshine_fe/apis/bar_api.dart';
import 'package:moonshine_fe/apis/favorite_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/screens/map_screen.dart';
import 'package:moonshine_fe/widgets/bar_detail_blog_list_widget.dart';
import 'package:moonshine_fe/widgets/bar_detail_image_widget.dart';

class BarDetailScreen extends StatefulWidget {
  final int id;
  final String name;
  final Geolocation geolocation;
  final bool isFavorite;
  const BarDetailScreen({
    super.key,
    required this.id,
    required this.name,
    // required this.url,
    required this.geolocation,
    required this.isFavorite,
  });

  @override
  State<BarDetailScreen> createState() => _BarDetailScreenState();
}

class _BarDetailScreenState extends State<BarDetailScreen> {
  late Future<Map<String, dynamic>> detail;
  bool currentFavorite = false;

  @override
  void initState() {
    super.initState();
    // detail = DiffordsGuide.getDetail(widget.id);
    detail = BarApi.getDetail(widget.id);
    currentFavorite = widget.isFavorite;
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
                  onPressed: () async {
                    var result = await FavoriteApi.toggleBarFavorite(widget.id);
                    currentFavorite = result;
                    setState(() {});
                  },
                  icon: Icon(currentFavorite
                      ? Icons.bookmark
                      : Icons.bookmark_border_outlined),
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
                    BarDetailImage(
                        imgList: ['assets/image/${snapshot.data!["url"]}']),
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
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                // color: Colors.yellow,
                              ),
                              Text(
                                '${snapshot.data!["score"].toString()} / 5.0',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // description
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
                          // Text(
                          //   "소개",
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.w600,
                          //     fontFamily: Theme.of(context)
                          //         .textTheme
                          //         .bodyMedium!
                          //         .fontFamily,
                          //   ),
                          // ),
                          // const VerticalDivider(
                          //   color: Colors.black38,
                          //   thickness: 1,
                          // ),
                          Expanded(
                            child: Text(
                              snapshot.data!['description'],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    // Address
                    const SizedBox(
                      height: 20,
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
                    // Map
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: SizedBox(
                        height: 150,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              snapshot.data!['latitude'],
                              snapshot.data!['longitude'],
                            ),
                            zoom: 15,
                          ),
                          zoomGesturesEnabled: false,
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          minMaxZoomPreference:
                              const MinMaxZoomPreference(15, 15),
                          myLocationButtonEnabled: false,
                          myLocationEnabled: false,
                          markers: {
                            Marker(
                              markerId: const MarkerId("1"),
                              draggable: false,
                              onTap: () {},
                              position: LatLng(
                                snapshot.data!['latitude'],
                                snapshot.data!['longitude'],
                              ),
                            ),
                          },
                          onTap: (Null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapScreen(
                                  geolocation: widget.geolocation,
                                ),
                              ),
                            );
                          },
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
                          Text(snapshot.data!['contact']),
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
                          Text(snapshot.data!['opening_hours']),
                          const SizedBox(
                            width: 20,
                            // height: 20,
                          ),
                        ],
                      ),
                    ),
                    // Menus Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            '메뉴',
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontFamily,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Menus
                    Column(
                      children: [
                        for (var menu in snapshot.data!["menu"])
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: Text(menu["name"]),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Text('${menu["price"]}₩'),
                                    ),
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      // color: Colors.yellow,
                                    ),
                                    Text(
                                      menu["score"] == null
                                          ? '- / 5.0'
                                          : '${menu["score"]} / 5.0',
                                      // style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                    // Blogs Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            '블로그',
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontFamily,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Blogs
                    BarDetailBlogList(
                      blogList: snapshot.data!['blogs'],
                      geolocation: widget.geolocation,
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
