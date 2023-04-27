import 'package:flutter/material.dart';
// import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:moonshine_fe/apis/cocktail_project.dart';
import 'package:fl_chart/fl_chart.dart';

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
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final size = constraints.maxWidth;
                              return SizedBox(
                                height: size,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: RadarChart(
                                    RadarChartData(
                                      dataSets: [
                                        RadarDataSet(
                                          dataEntries: [
                                            const RadarEntry(value: 5),
                                            const RadarEntry(value: 5),
                                            const RadarEntry(value: 5),
                                            const RadarEntry(value: 5),
                                            const RadarEntry(value: 5),
                                          ],
                                          fillColor: Colors.transparent,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          entryRadius: 0,
                                        ),
                                        RadarDataSet(
                                          dataEntries: [
                                            const RadarEntry(value: 2),
                                            const RadarEntry(value: 3),
                                            const RadarEntry(value: 4),
                                            const RadarEntry(value: 3),
                                            const RadarEntry(value: 2),
                                          ],
                                          fillColor:
                                              Colors.blue.withOpacity(0.3),
                                          borderColor: Colors.blue,
                                        ),
                                        RadarDataSet(
                                          dataEntries: [
                                            const RadarEntry(value: 4),
                                            const RadarEntry(value: 4),
                                            const RadarEntry(value: 1),
                                            const RadarEntry(value: 4),
                                            const RadarEntry(value: 4),
                                          ],
                                          fillColor:
                                              Colors.red.withOpacity(0.3),
                                          borderColor: Colors.red,
                                        ),
                                      ],
                                      radarShape: RadarShape.polygon,
                                      tickCount: 4,
                                      tickBorderData: const BorderSide(
                                        color: Colors.black12,
                                        width: 1,
                                      ),
                                      gridBorderData: const BorderSide(
                                        color: Colors.black26,
                                        width: 1,
                                      ),
                                      radarBorderData: const BorderSide(
                                        color: Colors.black38,
                                        width: 1,
                                      ),
                                      getTitle: (index, angle) {
                                        var title = [
                                          'Sweet',
                                          'Sour',
                                          'Bitter',
                                          'Spice',
                                          'Alcohol'
                                        ];
                                        return RadarChartTitle(
                                          text: title[index],
                                          angle: 0,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
