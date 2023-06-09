import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/screens/blog_detail_image_screen.dart';
import 'package:moonshine_fe/config.dart' as globals;

class BlogTabImageList extends StatelessWidget {
  final int id, type;
  final String imgUrl, name;
  final Geolocation geolocation;
  const BlogTabImageList({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.type,
    required this.geolocation,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          if (id != -1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlogDetailImageScreen(
                  id: id,
                  type: type,
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
                        : Image.network(
                            '${globals.baseUrl}/$imgUrl',
                            fit: BoxFit.cover,
                            width: size,
                            height: size,
                          ),
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              // IconButton(
                              //   onPressed: () {},
                              //   icon: const Icon(
                              //     Icons.bookmark_border_outlined,
                              //   ),
                              //   color: Colors.white,
                              // ),
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
                                        name.length > 14
                                            ? name.substring(0, 14)
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
