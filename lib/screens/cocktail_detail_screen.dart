import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_api.dart';
import 'package:moonshine_fe/apis/favorite_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/widgets/cocktail_detail_blog_list_widget.dart';
import 'package:moonshine_fe/widgets/cocktail_detail_chart_widget.dart';
import 'package:moonshine_fe/widgets/cocktail_detail_cocktail_list_widget.dart';
import 'package:moonshine_fe/widgets/cocktail_detail_image_widget.dart';

class CocktailDetailScreen extends StatefulWidget {
  final int id;
  final String name;
  final String imgUrl;
  final Geolocation geolocation;
  final bool isFavorite;

  const CocktailDetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.geolocation,
    required this.isFavorite,
  });

  @override
  State<CocktailDetailScreen> createState() => _CocktailDetailScreenState();
}

class _CocktailDetailScreenState extends State<CocktailDetailScreen> {
  late Future<Map<String, dynamic>> detail;
  bool currentFavorite = false;

  @override
  void initState() {
    super.initState();
    // detail = CocktailProject.getDetail(widget.name);
    detail = CocktailApi.getDetail(widget.id);
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
                    var result =
                        await FavoriteApi.toggleCocktailFavorite(widget.id);
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
                    CocktailDetailImage(
                      // imgList: snapshot.data!['imgList'],
                      imgList: ['assets/image/${widget.imgUrl}'],
                    ),
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
                        Text(
                          '${snapshot.data!["tastes"]["alcohol"]}%',
                          style: TextStyle(
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .fontFamily,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    // Chart
                    CocktailDetailChart(
                      cocktail_name: widget.name,
                      cocktail_gentle:
                          snapshot.data!['tastes']['gentle'].toDouble(),
                      cocktail_boozy:
                          snapshot.data!['tastes']['boozy'].toDouble(),
                      cocktail_sweet:
                          snapshot.data!['tastes']['sweet'].toDouble(),
                      cocktail_dry: snapshot.data!['tastes']['dry'].toDouble(),
                      cocktail_alcohol:
                          snapshot.data!['tastes']['alcohol'].toDouble() / 10.0,
                    ),
                    // Ingredients, Recipe Title
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                'Ingredients',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .fontFamily,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                'Recipe',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .fontFamily,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Ingredients, Recipe
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var item
                                        in snapshot.data!['ingredients'])
                                      Text(
                                        '${item["name"].trim()} - ${item["quantity"].trim()}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .fontFamily,
                                        ),
                                      ),
                                  ]),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black38,
                            thickness: 1,
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!['recipe'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Bars Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                          child: Text(
                            'Bars',
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
                    // Bars List
                    // CocktailDetailBarList(
                    //   geolocation: widget.geolocation,
                    // ),
                    // Similar Cocktails Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            'Similar Cocktails',
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
                    // Similar Cocktails List
                    CocktailDetailCocktailList(
                      geolocation: widget.geolocation,
                    ),
                    // // User Recipes Title
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    //       child: Text(
                    //         'User Recipes',
                    //         style: TextStyle(
                    //           fontFamily: Theme.of(context)
                    //               .textTheme
                    //               .bodyMedium!
                    //               .fontFamily,
                    //           fontSize: 20,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // // User Recipes List
                    // Row(
                    //   children: const [
                    //     Expanded(
                    //       child: Center(
                    //         child: Text('User Recipes List'),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Blogs Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            'Blogs',
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
                    // Blogs List
                    // Row(
                    //   children: const [
                    //     Expanded(
                    //       child: Center(
                    //         child: Text('Blogs List'),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    CocktailDetailBlogList(
                      blogList: snapshot.data!['blogs'],
                      geolocation: widget.geolocation,
                    ),
                    // SizedBox
                    const SizedBox(
                      height: 50,
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
