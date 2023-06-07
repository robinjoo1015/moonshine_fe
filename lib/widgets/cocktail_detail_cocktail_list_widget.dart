import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/widgets/cocktail_tab_item_widget.dart';

class CocktailDetailCocktailList extends StatelessWidget {
  final Geolocation geolocation;
  CocktailDetailCocktailList({
    super.key,
    required this.geolocation,
  });
  // final Future<List<Map<String, String>>> cocktailList =
  //     CocktailProject.getCocktailList();
  final Future<List<Map<String, dynamic>>> cocktailList =
      CocktailApi.getCocktailList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cocktailList,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
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
                        items: snapshot.data!.map((item) {
                          return Builder(builder: (BuildContext context) {
                            return Flex(
                              direction: Axis.horizontal,
                              children: [
                                CocktailTabItem(
                                  imgUrl: item['url']!,
                                  name: item['name']!,
                                  geolocation: geolocation,
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
    );
  }
}
