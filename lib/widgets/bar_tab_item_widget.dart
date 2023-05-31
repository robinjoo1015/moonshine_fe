import 'package:flutter/material.dart';
import 'package:moonshine_fe/screens/bar_detail_screen.dart';

class BarTabItem extends StatelessWidget {
  final String imgUrl, name;
  const BarTabItem({
    super.key,
    required this.imgUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BarDetailScreen(
              name: name,
            ),
          ),
        );
      }, child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.maxWidth;
          return SizedBox(
            width: size,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Stack(
                children: [
                  Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark_border_outlined,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Text(
                                name.length > 16 ? name.substring(0, 16) : name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
