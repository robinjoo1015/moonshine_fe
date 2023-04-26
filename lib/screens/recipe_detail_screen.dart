import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String name;
  const RecipeDetailScreen({
    super.key,
    required this.name,
  });

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
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
            )
          ];
        },
        body: FutureBuilder(
          future: detail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
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
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const PageScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: size,
                                      width: size,
                                      child: Image.network(
                                        CocktailProject.baseUrl +
                                            snapshot.data!['imgList']
                                                [index % 3],
                                        width: size,
                                        height: size,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: RadarChart.light(
                              ticks: const [1, 2, 3, 4, 5],
                              features: const [
                                'Sweet',
                                'Sour',
                                'Bitter',
                                'Spice',
                                'Alcohol'
                              ],
                              data: const [
                                [3, 2, 4, 1, 3],
                                [4, 3, 2, 2.5, 1],
                              ],
                              useSides: true,
                            ),
                          ),
                        ],
                      ),
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
