import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CocktailDetailChart extends StatefulWidget {
  final String name;

  const CocktailDetailChart({super.key, required this.name});

  @override
  State<CocktailDetailChart> createState() => _CocktailDetailChartState();
}

class _CocktailDetailChartState extends State<CocktailDetailChart> {
  final ScrollController chartScrollController = ScrollController();
  final CarouselController _controller = CarouselController();
  int _current = 0;

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
                    height: size / 2 + 50,
                    width: size,
                    child: Stack(
                      children: [
                        CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                            height: size,
                            aspectRatio: 1,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: false,
                            scrollPhysics: const PageScrollPhysics(
                                parent: ClampingScrollPhysics()),
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          items: [
                            // Two Pentagons
                            SizedBox(
                              height: size / 2,
                              width: size,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size / 2,
                                    height: size / 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
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
                                              positionPercentageOffset: 0.1,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size / 2,
                                    height: size / 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
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
                                              positionPercentageOffset: 0.1,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Two Pentagons
                            // Decagon
                            // SizedBox(
                            //   width: size,
                            //   height: size,
                            //   child: RadarChart(
                            //     RadarChartData(
                            //       dataSets: [
                            //         RadarDataSet(
                            //           dataEntries: [
                            //             const RadarEntry(value: 5),
                            //             const RadarEntry(value: 5),
                            //             const RadarEntry(value: 5),
                            //             const RadarEntry(value: 5),
                            //             const RadarEntry(value: 5),
                            //             const RadarEntry(value: 5),
                            //             const RadarEntry(value: 5),
                            //             const RadarEntry(value: 5),
                            //             const RadarEntry(value: 5),
                            //             const RadarEntry(value: 5),
                            //           ],
                            //           fillColor: Colors.transparent,
                            //           borderColor: Colors.transparent,
                            //           borderWidth: 0,
                            //           entryRadius: 0,
                            //         ),
                            //         RadarDataSet(
                            //           dataEntries: [
                            //             const RadarEntry(value: 2),
                            //             const RadarEntry(value: 3),
                            //             const RadarEntry(value: 4),
                            //             const RadarEntry(value: 3),
                            //             const RadarEntry(value: 2),
                            //             const RadarEntry(value: 2),
                            //             const RadarEntry(value: 3),
                            //             const RadarEntry(value: 4),
                            //             const RadarEntry(value: 3),
                            //             const RadarEntry(value: 2),
                            //           ],
                            //           fillColor: Colors.blue.withOpacity(0.3),
                            //           borderColor: Colors.blue,
                            //         ),
                            //         RadarDataSet(
                            //           dataEntries: [
                            //             const RadarEntry(value: 4),
                            //             const RadarEntry(value: 4),
                            //             const RadarEntry(value: 1),
                            //             const RadarEntry(value: 4),
                            //             const RadarEntry(value: 4),
                            //             const RadarEntry(value: 4),
                            //             const RadarEntry(value: 4),
                            //             const RadarEntry(value: 1),
                            //             const RadarEntry(value: 4),
                            //             const RadarEntry(value: 4),
                            //           ],
                            //           fillColor: Colors.red.withOpacity(0.3),
                            //           borderColor: Colors.red,
                            //         ),
                            //       ],
                            //       radarShape: RadarShape.polygon,
                            //       tickCount: 4,
                            //       tickBorderData: const BorderSide(
                            //         color: Colors.black12,
                            //         width: 1,
                            //       ),
                            //       gridBorderData: const BorderSide(
                            //         color: Colors.black26,
                            //         width: 1,
                            //       ),
                            //       radarBorderData: const BorderSide(
                            //         color: Colors.black38,
                            //         width: 1,
                            //       ),
                            //       getTitle: (index, angle) {
                            //         var title = [
                            //           'Danmat',
                            //           'Jjanmat',
                            //           'Sseunmat',
                            //           'Shinmat',
                            //           'Gamchilmat',
                            //           'Flower',
                            //           'Fruit',
                            //           'Citrus',
                            //           'Smoky',
                            //           'Alchohol'
                            //         ];
                            //         return RadarChartTitle(
                            //           text: title[index],
                            //           angle: 0,
                            //           positionPercentageOffset: 0.1,
                            //         );
                            //       },
                            //     ),
                            //   ),
                            // ),
                            // Decagon
                            SizedBox(
                              width: size,
                              height: size / 2,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size / 2,
                                    height: size / 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
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
                                                  getTitlesWidget:
                                                      (value, meta) {
                                                    var title = [
                                                      'Sweet',
                                                      'Sour',
                                                      'Bitter',
                                                      'Spice',
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
                                                            meta.parentAxisSize *
                                                                0.5,
                                                        parentAxisSize:
                                                            meta.parentAxisSize,
                                                        distanceFromEdge: 0,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            title[
                                                                value.toInt() -
                                                                    1],
                                                            textAlign:
                                                                TextAlign.end,
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
                                              touchTooltipData:
                                                  BarTouchTooltipData(
                                                tooltipBgColor:
                                                    Colors.transparent,
                                                tooltipPadding: EdgeInsets.zero,
                                                tooltipMargin: 0,
                                                fitInsideHorizontally: true,
                                                fitInsideVertically: false,
                                                rotateAngle: -90,
                                                getTooltipItem: (group,
                                                    groupIndex, rod, rodIndex) {
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
                                                    toY: 5,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 4,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 2,
                                                barRods: [
                                                  BarChartRodData(
                                                    toY: 2,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 3.5,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 3,
                                                barRods: [
                                                  BarChartRodData(
                                                    toY: 2.5,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 4,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 4,
                                                barRods: [
                                                  BarChartRodData(
                                                    toY: 1.5,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 3,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 5,
                                                barRods: [
                                                  BarChartRodData(
                                                    toY: 4,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 1,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size / 2,
                                    height: size / 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
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
                                                  getTitlesWidget:
                                                      (value, meta) {
                                                    var title = [
                                                      'Sweet',
                                                      'Sour',
                                                      'Bitter',
                                                      'Spice',
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
                                                            meta.parentAxisSize *
                                                                0.5,
                                                        parentAxisSize:
                                                            meta.parentAxisSize,
                                                        distanceFromEdge: 0,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            title[
                                                                value.toInt() -
                                                                    1],
                                                            textAlign:
                                                                TextAlign.end,
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
                                              touchTooltipData:
                                                  BarTouchTooltipData(
                                                tooltipBgColor:
                                                    Colors.transparent,
                                                tooltipPadding: EdgeInsets.zero,
                                                tooltipMargin: 0,
                                                fitInsideHorizontally: true,
                                                fitInsideVertically: false,
                                                rotateAngle: -90,
                                                getTooltipItem: (group,
                                                    groupIndex, rod, rodIndex) {
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
                                                    toY: 5,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 4,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 2,
                                                barRods: [
                                                  BarChartRodData(
                                                    toY: 2,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 3.5,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 3,
                                                barRods: [
                                                  BarChartRodData(
                                                    toY: 2.5,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 4,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 4,
                                                barRods: [
                                                  BarChartRodData(
                                                    toY: 1.5,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 3,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                              BarChartGroupData(
                                                x: 5,
                                                barRods: [
                                                  BarChartRodData(
                                                    toY: 4,
                                                    color: Colors.blue,
                                                  ),
                                                  BarChartRodData(
                                                    toY: 1,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                                barsSpace: 1,
                                                showingTooltipIndicators: [
                                                  0,
                                                  1
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
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
                                )
                              ],
                            ),
                            SizedBox(
                              height: size / 4 - 50,
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
                                    child: Text(widget.name),
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
                                        'Match 80%',
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
