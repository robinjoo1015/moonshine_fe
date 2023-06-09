import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/bar_api.dart';
import 'package:moonshine_fe/apis/cocktail_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/widgets/bar_tab_item_widget.dart';
import 'package:moonshine_fe/widgets/cocktail_tab_item_widget.dart';

class BlogDetailImageLists extends StatelessWidget {
  final int type;
  final Map<String, dynamic> detail;
  final Geolocation geolocation;
  BlogDetailImageLists({
    super.key,
    required this.type,
    required this.detail,
    required this.geolocation,
  });
  final Future<List<Map<String, dynamic>>> cocktailList =
      CocktailApi.getCocktailList();
  final Future<List<Map<String, dynamic>>> barList = BarApi.getBarList();

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 1:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Bar',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium!.fontFamily,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: barList,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var barListNew = [];
                  for (var bar in snapshot.data!) {
                    if (bar["id"] == detail["bar_id"]) {
                      barListNew.add(bar);
                    }
                  }
                  return Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final size = constraints.maxWidth;
                            return SizedBox(
                              height: size / 2,
                              width: size,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: size / 2,
                                  viewportFraction: 0.45,
                                  scrollDirection: Axis.horizontal,
                                  animateToClosest: false,
                                  enableInfiniteScroll: false,
                                  disableCenter: true,
                                  pageSnapping: false,
                                  padEnds: false,
                                ),
                                items: barListNew.map((item) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        BarTabItem(
                                          id: item['id']!,
                                          imgUrl: item['url']!,
                                          name: item['name']!,
                                          geolocation: geolocation,
                                          isFavorite: false,
                                        ),
                                      ],
                                    );
                                  });
                                }).toList(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    height: 100,
                  );
                }
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Cocktails',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium!.fontFamily,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final size = constraints.maxWidth;
                      return SizedBox(
                        height: size / 2,
                        width: size,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            // height: 200,
                            height: size / 2,
                            // aspectRatio: 1,
                            viewportFraction: 0.45,
                            scrollDirection: Axis.horizontal,
                            animateToClosest: false,
                            enableInfiniteScroll: false,
                            disableCenter: true,
                            pageSnapping: false,
                            padEnds: false,
                          ),
                          items: detail['cocktails'].map<Widget>((item) {
                            return Builder(builder: (BuildContext context) {
                              return Flex(
                                direction: Axis.horizontal,
                                // height: size / 2,
                                // width: size / 2,
                                children: [
                                  CocktailTabItem(
                                    id: item['id'],
                                    imgUrl: item['url']!,
                                    name: item['name']!,
                                    // url: item['url']!,
                                    geolocation: geolocation,
                                    isFavorite: item['is_favorite'] ?? false,
                                  ),
                                ],
                              );
                            });
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Cocktail',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium!.fontFamily,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: cocktailList,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var cocktailListNew = [];
                  for (var cocktail in snapshot.data!) {
                    if (cocktail["id"] == detail["cocktail_id"]) {
                      cocktailListNew.add(cocktail);
                    }
                  }
                  return Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final size = constraints.maxWidth;
                            return SizedBox(
                              height: size / 2,
                              width: size,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: size / 2,
                                  viewportFraction: 0.45,
                                  scrollDirection: Axis.horizontal,
                                  animateToClosest: false,
                                  enableInfiniteScroll: false,
                                  disableCenter: true,
                                  pageSnapping: false,
                                  padEnds: false,
                                ),
                                items: cocktailListNew.map((item) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        CocktailTabItem(
                                          id: item['id']!,
                                          imgUrl: item['url']!,
                                          name: item['name']!,
                                          geolocation: geolocation,
                                          isFavorite: item['is_favorite'],
                                        ),
                                      ],
                                    );
                                  });
                                }).toList(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    height: 100,
                  );
                }
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Bars',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium!.fontFamily,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final size = constraints.maxWidth;
                      return SizedBox(
                        height: size / 2,
                        width: size,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            // height: 200,
                            height: size / 2,
                            // aspectRatio: 1,
                            viewportFraction: 0.45,
                            scrollDirection: Axis.horizontal,
                            animateToClosest: false,
                            enableInfiniteScroll: false,
                            disableCenter: true,
                            pageSnapping: false,
                            padEnds: false,
                          ),
                          items: detail['bars'].map<Widget>((item) {
                            return Builder(builder: (BuildContext context) {
                              return Flex(
                                direction: Axis.horizontal,
                                // height: size / 2,
                                // width: size / 2,
                                children: [
                                  BarTabItem(
                                    id: item['id'],
                                    imgUrl: item['url']!,
                                    name: item['name']!,
                                    // url: item['url']!,
                                    geolocation: geolocation,
                                    isFavorite: false,
                                  ),
                                ],
                              );
                            });
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Cocktail',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium!.fontFamily,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: cocktailList,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var cocktailListNew = [];
                  for (var cocktail in snapshot.data!) {
                    if (cocktail["id"] == detail["cocktail_id"]) {
                      cocktailListNew.add(cocktail);
                    }
                  }
                  return Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final size = constraints.maxWidth;
                            return SizedBox(
                              height: size / 2,
                              width: size,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: size / 2,
                                  viewportFraction: 0.45,
                                  scrollDirection: Axis.horizontal,
                                  animateToClosest: false,
                                  enableInfiniteScroll: false,
                                  disableCenter: true,
                                  pageSnapping: false,
                                  padEnds: false,
                                ),
                                items: cocktailListNew.map((item) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        CocktailTabItem(
                                          id: item['id']!,
                                          imgUrl: item['url']!,
                                          name: item['name']!,
                                          geolocation: geolocation,
                                          isFavorite: false,
                                        ),
                                      ],
                                    );
                                  });
                                }).toList(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    height: 100,
                  );
                }
              }),
            ),
          ],
        );
      default:
    }
    return Column(
      children: const [],
    );
  }
}
