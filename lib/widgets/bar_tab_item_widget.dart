import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/screens/bar_detail_screen.dart';

class BarTabItem extends StatelessWidget {
  final int id;
  final String imgUrl, name;
  final Geolocation geolocation;
  const BarTabItem({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.geolocation,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          if (id != -1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BarDetailScreen(
                  id: id,
                  name: name,
                  // url: url,
                  geolocation: geolocation,
                ),
              ),
            );
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.maxWidth;
            return SizedBox(
              width: size,
              height: size,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                child: Stack(
                  children: [
                    (id == -1)
                        ? Container()
                        : Image(
                            // imgUrl,
                            image: AssetImage('assets/image/$imgUrl'),
                            fit: BoxFit.cover,
                            // centerSlice: Rect.fromCenter(
                            //   center: Offset(size / 2, size / 2),
                            //   width: size,
                            //   height: size,
                            // ),
                            width: size,
                            height: size,
                          ),
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              (id == -1)
                                  ? Container()
                                  : IconButton(
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
                                child: (id == -1)
                                    ? Container()
                                    : Text(
                                        name.length > 16
                                            ? name.substring(0, 16)
                                            : name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
