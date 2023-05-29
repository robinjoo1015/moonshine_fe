import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';
import 'package:moonshine_fe/widgets/bar_tab_item_widget.dart';

class CocktailDetailBarList extends StatelessWidget {
  CocktailDetailBarList({super.key});
  final Future<List<Map<String, String>>> barList = DiffordsGuide.getBarList();

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
                                  imgUrl: item['imgUrl']!,
                                  name: item['name']!,
                                )
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
