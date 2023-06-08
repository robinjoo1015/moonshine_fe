import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/widgets/blog_tab_image_list_widget.dart';

class BarDetailBlogList extends StatelessWidget {
  final List<dynamic> blogList;
  final Geolocation geolocation;
  const BarDetailBlogList({
    super.key,
    required this.blogList,
    required this.geolocation,
  });

  @override
  Widget build(BuildContext context) {
    print(blogList);
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
                  items: blogList.map<Widget>((item) {
                    return Builder(builder: (BuildContext context) {
                      return Flex(
                        direction: Axis.horizontal,
                        children: [
                          BlogTabImageList(
                            id: item['id']!,
                            imgUrl: item['url']!,
                            name: item['title']!,
                            geolocation: geolocation,
                            type: item['type']!,
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
  }
}
