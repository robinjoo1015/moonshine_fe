import 'package:flutter/material.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';
import 'package:moonshine_fe/widgets/cocktail_detail_bar_list_widget.dart';
import 'package:moonshine_fe/widgets/cocktail_detail_chart_widget.dart';
import 'package:moonshine_fe/widgets/cocktail_detail_image_widget.dart';

class CocktailDetailScreen extends StatefulWidget {
  final String name;

  const CocktailDetailScreen({
    super.key,
    required this.name,
  });

  @override
  State<CocktailDetailScreen> createState() => _CocktailDetailScreenState();
}

class _CocktailDetailScreenState extends State<CocktailDetailScreen> {
  late Future<Map<String, dynamic>> detail;

  @override
  void initState() {
    super.initState();
    detail = CocktailProject.getDetail(widget.name);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(widget.name),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border_outlined),
                )
              ],
            ),
          ];
        },
        body: FutureBuilder(
          future: detail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    // Image
                    CocktailDetailImage(
                      imgList: snapshot.data!['imgList'],
                    ),
                    // Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontFamily,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          '40%',
                          style: TextStyle(
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .fontFamily,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    // Chart
                    CocktailDetailChart(name: widget.name),
                    // Ingredients, Recipe Title
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Ingredients',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontFamily,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'Recipe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Ingredients, Recipe
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ingredient1',
                                    style: TextStyle(
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .fontFamily,
                                    ),
                                  ),
                                  Text(
                                    'Ingredient2',
                                    style: TextStyle(
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .fontFamily,
                                    ),
                                  ),
                                  Text(
                                    'Ingredient3',
                                    style: TextStyle(
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black38,
                            thickness: 1,
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1. Recipe1Recipe1Recipe1Recipe1Recipe1Recipe1',
                                    style: TextStyle(
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .fontFamily,
                                    ),
                                  ),
                                  Text(
                                    '2. Recipe2Recipe2Recipe2Recipe2Recipe2Recipe2',
                                    style: TextStyle(
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .fontFamily,
                                    ),
                                  ),
                                  Text(
                                    '3. Recipe3Recipe3Recipe3Recipe3Recipe3Recipe3',
                                    style: TextStyle(
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Bars Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                          child: Text(
                            'Bars',
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontFamily,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Bars List
                    CocktailDetailBarList(),
                    // Sized Box
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  widget.name,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
