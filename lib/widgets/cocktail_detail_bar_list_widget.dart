import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:moonshine_fe/apis/bar_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/widgets/bar_tab_item_widget.dart';

class CocktailDetailBarList extends StatelessWidget {
  final Geolocation geolocation;
  CocktailDetailBarList({
    super.key,
    required this.geolocation,
  });
  // final Future<List<Map<String, String>>> barList = DiffordsGuide.getBarList();
  final Future<List<Map<String, dynamic>>> barList = BarApi.getBarList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: barList,
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
                        items: snapshot.data!.map((item) {
                          return Builder(builder: (BuildContext context) {
                            return Flex(
                              direction: Axis.horizontal,
                              // height: size / 2,
                              // width: size / 2,
                              children: [
                                BarTabItem(
                                  id: item['id'],
                                  imgUrl: item['imgUrl']!,
                                  name: item['name']!,
                                  // url: item['url']!,
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
    );
  }
}
