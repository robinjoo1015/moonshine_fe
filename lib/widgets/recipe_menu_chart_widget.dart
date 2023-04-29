import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RecipeMenuChart extends StatelessWidget {
  final String name;
  RecipeMenuChart({super.key, required this.name});
  final ScrollController chartScrollController = ScrollController();

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
                    height: size,
                    width: size,
                    child: Stack(
                      children: [
                        ListView(
                          controller: chartScrollController,
                          scrollDirection: Axis.horizontal,
                          physics: const PageScrollPhysics(
                            parent: ClampingScrollPhysics(),
                          ),
                          children: [
                            SizedBox(
                              height: size,
                              width: size,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 40,
                                  horizontal: 40,
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
                                        fillColor: Colors.blue.withOpacity(0.3),
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
                              width: size,
                              height: size,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 40,
                                  horizontal: 40,
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
                                            getTitlesWidget: (value, meta) {
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
                                              toY: 5,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: 4,
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
                                              toY: 2,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: 3.5,
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
                                              toY: 2.5,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: 4,
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
                                              toY: 1.5,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: 3,
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
                                              toY: 4,
                                              color: Colors.blue,
                                            ),
                                            BarChartRodData(
                                              toY: 1,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    chartScrollController.animateTo(
                                      chartScrollController.offset - size,
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_outlined,
                                    size: 12,
                                    // color: (chartScrollController.hasClients &&
                                    //         chartScrollController.offset ==
                                    //             chartScrollController
                                    //                 .position.minScrollExtent)
                                    //     ? Colors.black
                                    //     : Colors.transparent,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    chartScrollController.animateTo(
                                      chartScrollController.offset + size,
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 12,
                                    // color: (chartScrollController.hasClients &&
                                    //         chartScrollController.offset ==
                                    //             chartScrollController
                                    //                 .position.maxScrollExtent)
                                    //     ? Colors.black
                                    //     : Colors.transparent,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 40,
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
                                    child: Text(name),
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
