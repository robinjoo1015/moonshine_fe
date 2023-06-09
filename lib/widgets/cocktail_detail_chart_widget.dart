import 'dart:core';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:moonshine_fe/config.dart' as globals;

class CocktailDetailChart extends StatefulWidget {
  final String cocktail_name;
  final double cocktail_gentle;
  final double cocktail_boozy;
  final double cocktail_sweet;
  final double cocktail_dry;
  final double cocktail_alcohol;
  const CocktailDetailChart({
    super.key,
    required this.cocktail_name,
    required this.cocktail_gentle,
    required this.cocktail_boozy,
    required this.cocktail_sweet,
    required this.cocktail_dry,
    required this.cocktail_alcohol,
  });

  @override
  State<CocktailDetailChart> createState() => _CocktailDetailChartState();
}

class _CocktailDetailChartState extends State<CocktailDetailChart> {
  final ScrollController chartScrollController = ScrollController();
  final CarouselController _controller = CarouselController();
  int _current = 0;
  int matchPreference = 0;

  @override
  void initState() {
    super.initState();
    matchPreference = 100 -
        (((widget.cocktail_alcohol - globals.user_alcohol).abs() +
                    (widget.cocktail_boozy - globals.user_boozy).abs() +
                    (widget.cocktail_dry - globals.user_dry).abs() +
                    (widget.cocktail_gentle - globals.user_gentle).abs() +
                    (widget.cocktail_sweet - globals.user_sweet).abs()) *
                4)
            .toInt();
    setState(() {});
  }

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
                    // height: size / 2 + 50,
                    height: size - 50,
                    width: size,
                    child: Stack(
                      children: [
                        CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                            height: size,
                            // aspectRatio: 1,
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
                          items: [
                            SizedBox(
                              width: size,
                              height: size,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 20, 50, 50),
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
                                          RadarEntry(
                                              value: globals.user_gentle),
                                          RadarEntry(value: globals.user_boozy),
                                          RadarEntry(value: globals.user_sweet),
                                          RadarEntry(value: globals.user_dry),
                                          RadarEntry(
                                              value: globals.user_alcohol),
                                        ],
                                        fillColor: Colors.blue.withOpacity(0.3),
                                        borderColor: Colors.blue,
                                      ),
                                      RadarDataSet(
                                        dataEntries: [
                                          RadarEntry(
                                              value: widget.cocktail_gentle),
                                          RadarEntry(
                                              value: widget.cocktail_boozy),
                                          RadarEntry(
                                              value: widget.cocktail_sweet),
                                          RadarEntry(
                                              value: widget.cocktail_dry),
                                          RadarEntry(
                                              value: widget.cocktail_alcohol),
                                        ],
                                        fillColor: Colors.red.withOpacity(0.3),
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
                                        'Gentle',
                                        'Boozy',
                                        'Sweet',
                                        'Dry',
                                        'Alcohol',
                                      ];
                                      return RadarChartTitle(
                                        text: title[index],
                                        angle: 0,
                                        positionPercentageOffset: 0.1,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // Decagon
                            // Single Bar
                            SizedBox(
                              width: size,
                              // height: size / 2,
                              height: size,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 20, 30, 50),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: BarChart(
                                    BarChartData(
                                      minY: 0,
                                      maxY: 5,
                                      titlesData: FlTitlesData(
                                        show: true,
                                        rightTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        topTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 50,
                                            interval: 50,
                                            getTitlesWidget: (value, meta) {
                                              var title = [
                                                'Gentle',
                                                'Boozy',
                                                'Sweet',
                                                'Dry',
                                                'Alcohol',
                                              ];
                                              return SideTitleWidget(
                                                axisSide: meta.axisSide,
                                                angle: -pi / 2,
                                                space: 15,
                                                fitInside:
                                                    SideTitleFitInsideData(
                                                  enabled: true,
                                                  axisPosition:
                                                      meta.parentAxisSize * 0.5,
                                                  parentAxisSize:
                                                      meta.parentAxisSize,
                                                  distanceFromEdge: 0,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      title[value.toInt() - 1],
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        leftTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                      ),
                                      gridData: FlGridData(
                                        show: false,
                                      ),
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      barTouchData: BarTouchData(
                                        enabled: false,
                                        touchTooltipData: BarTouchTooltipData(
                                          tooltipBgColor: Colors.transparent,
                                          tooltipPadding: EdgeInsets.zero,
                                          tooltipMargin: 0,
                                          fitInsideHorizontally: true,
                                          fitInsideVertically: false,
                                          rotateAngle: -90,
                                          getTooltipItem: (group, groupIndex,
                                              rod, rodIndex) {
                                            return BarTooltipItem(
                                              rod.toY.toString(),
                                              (rodIndex == 0)
                                                  ? const TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.blue,
                                                    )
                                                  : const TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.red,
                                                    ),
                                            );
                                          },
                                        ),
                                      ),
                                      barGroups: [
                                        BarChartGroupData(
                                          x: 1,
                                          barRods: [
                                            BarChartRodData(
                                              toY: globals.user_gentle,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: widget.cocktail_gentle,
                                              color: Colors.red,
                                            ),
                                          ],
                                          barsSpace: 1,
                                          showingTooltipIndicators: [0, 1],
                                        ),
                                        BarChartGroupData(
                                          x: 2,
                                          barRods: [
                                            BarChartRodData(
                                              toY: globals.user_boozy,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: widget.cocktail_boozy,
                                              color: Colors.red,
                                            ),
                                          ],
                                          barsSpace: 1,
                                          showingTooltipIndicators: [0, 1],
                                        ),
                                        BarChartGroupData(
                                          x: 3,
                                          barRods: [
                                            BarChartRodData(
                                              toY: globals.user_sweet,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: widget.cocktail_sweet,
                                              color: Colors.red,
                                            ),
                                          ],
                                          barsSpace: 1,
                                          showingTooltipIndicators: [0, 1],
                                        ),
                                        BarChartGroupData(
                                          x: 4,
                                          barRods: [
                                            BarChartRodData(
                                              toY: globals.user_dry,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: widget.cocktail_dry,
                                              color: Colors.red,
                                            ),
                                          ],
                                          barsSpace: 1,
                                          showingTooltipIndicators: [0, 1],
                                        ),
                                        BarChartGroupData(
                                          x: 5,
                                          barRods: [
                                            BarChartRodData(
                                              toY: globals.user_alcohol,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: widget.cocktail_alcohol,
                                              color: Colors.red,
                                            ),
                                          ],
                                          barsSpace: 1,
                                          showingTooltipIndicators: [0, 1],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // chartScrollController.animateTo(
                                    //   chartScrollController.offset - size,
                                    //   duration: const Duration(
                                    //     milliseconds: 200,
                                    //   ),
                                    //   curve: Curves.easeIn,
                                    // );
                                    _controller.previousPage(
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  iconSize: 12,
                                  alignment: Alignment.centerLeft,
                                  icon: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    size: 12,
                                    color: (_current == 0)
                                        ? Colors.transparent
                                        : Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // chartScrollController.animateTo(
                                    //   chartScrollController.offset + size,
                                    //   duration: const Duration(
                                    //     milliseconds: 200,
                                    //   ),
                                    //   curve: Curves.easeIn,
                                    // );
                                    _controller.nextPage(
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  iconSize: 12,
                                  alignment: Alignment.centerRight,
                                  icon: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 12,
                                    color: (_current == 1)
                                        ? Colors.transparent
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              // height: size / 4 - 50,
                              height: (size) / 2 - 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text(widget.cocktail_name),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Text('My Preference'),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Match $matchPreference%',
                                        style: TextStyle(
                                          fontFamily: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .fontFamily,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
