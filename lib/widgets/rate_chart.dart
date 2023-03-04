import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';

class RateChart extends StatelessWidget {
  RateChart({
    Key? key,
    required this.dataMap,
  }) : super(key: key);

  final Map<String, double> dataMap;
  final colorList = <Color>[
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: AnimatedCircularChart(
        key: UniqueKey(),
        size: const Size(80, 80),
        initialChartData: <CircularStackEntry>[
          CircularStackEntry(
            <CircularSegmentEntry>[
              CircularSegmentEntry(
                dataMap.values.first,
                Colors.greenAccent,
                rankKey: 'completed',
              ),
              CircularSegmentEntry(
                dataMap.values.first,
                Colors.blueGrey[600],
                rankKey: 'remaining',
              ),
            ],
            rankKey: 'progress',
          ),
        ],
        chartType: CircularChartType.Radial,
        percentageValues: true,
        holeLabel: dataMap.values.first.toInt().toString(),
        labelStyle: TextStyle(
          color: Colors.blueGrey[600],
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
