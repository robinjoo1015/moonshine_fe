import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_api.dart';
import 'package:moonshine_fe/apis/favorite_api.dart';
import 'package:moonshine_fe/apis/geolocation.dart';
import 'package:moonshine_fe/screens/cocktail_detail_screen.dart';

class CocktailTabItem extends StatefulWidget {
  final int id;
  final String imgUrl, name;
  final Geolocation geolocation;
  final bool isFavorite;

  const CocktailTabItem({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.geolocation,
    required this.isFavorite,
  });

  @override
  State<CocktailTabItem> createState() => _CocktailTabItemState();
}

class _CocktailTabItemState extends State<CocktailTabItem> {
  // final baseUrl = CocktailProject.baseUrl;
  final baseUrl = CocktailApi.baseUrl;
  bool currentFavorite = false;

  @override
  void initState() {
    super.initState();
    currentFavorite = widget.isFavorite;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      // fit: FlexFit.loose,
      child: GestureDetector(
        onTap: () {
          if (widget.id != -1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CocktailDetailScreen(
                  id: widget.id,
                  name: widget.name,
                  imgUrl: widget.imgUrl,
                  geolocation: widget.geolocation,
                  isFavorite: widget.isFavorite,
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
                    // Image.network(
                    //   '$baseUrl/$imgUrl',
                    //   fit: BoxFit.fill,
                    // ),
                    (widget.id == -1)
                        ? Container()
                        : Image(
                            image: AssetImage('assets/image/${widget.imgUrl}'),
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
                            children: [
                              (widget.id == -1)
                                  ? Container()
                                  : IconButton(
                                      onPressed: () async {
                                        var result = await FavoriteApi
                                            .toggleCocktailFavorite(widget.id);
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
                                        widget.name.length > 20
                                            ? widget.name.substring(0, 20)
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
