import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BarDetailImage extends StatefulWidget {
  final List<String> imgList;
  const BarDetailImage({
    super.key,
    required this.imgList,
  });

  @override
  State<BarDetailImage> createState() => _BarDetailImageState();
}

class _BarDetailImageState extends State<BarDetailImage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final size = constraints.maxWidth;
                  return SizedBox(
                    height: size,
                    child: CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: size,
                        aspectRatio: 1,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: false,
                        scrollPhysics: const PageScrollPhysics(
                          parent: ClampingScrollPhysics(),
                        ),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: widget.imgList.map((item) {
                        return Builder(builder: (BuildContext context) {
                          return SizedBox(
                            height: size,
                            width: size,
                            // child: Image.network(
                            //   item,
                            //   width: size,
                            //   height: size,
                            //   fit: BoxFit.fitHeight,
                            // ),
                            child: Image(
                              image: AssetImage(item),
                              width: size,
                              height: size,
                              fit: BoxFit.fitHeight,
                            ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.asMap().entries.map((entry) {
            return Container(
              width: 5.0,
              height: 5.0,
              margin: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(_current == entry.key ? 0.9 : 0.3),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
