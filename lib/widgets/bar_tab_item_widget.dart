import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/favorite_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/screens/bar_detail_screen.dart';

class BarTabItem extends StatefulWidget {
  final int id;
  final String imgUrl, name;
  final Geolocation geolocation;
  final bool isFavorite;
  const BarTabItem({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.geolocation,
    required this.isFavorite,
  });

  @override
  State<BarTabItem> createState() => _BarTabItemState();
}

class _BarTabItemState extends State<BarTabItem> {
  bool currentFavorite = false;
  @override
  void initState() {
    super.initState();
    currentFavorite = widget.isFavorite;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          if (widget.id != -1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BarDetailScreen(
                  id: widget.id,
                  name: widget.name,
                  // url: url,
                  geolocation: widget.geolocation,
                  isFavorite: currentFavorite,
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
                    (widget.id == -1)
                        ? Container()
                        : Image(
                            // imgUrl,
                            image: AssetImage('assets/image/${widget.imgUrl}'),
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
                              (widget.id == -1)
                                  ? Container()
                                  : IconButton(
                                      onPressed: () async {
                                        var result =
                                            await FavoriteApi.toggleBarFavorite(
                                                widget.id);
                                        currentFavorite = result;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        currentFavorite
                                            ? Icons.bookmark
                                            : Icons.bookmark_border_outlined,
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
                                child: (widget.id == -1)
                                    ? Container()
                                    : Text(
                                        widget.name.length > 16
                                            ? widget.name.substring(0, 16)
                                            : widget.name,
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
