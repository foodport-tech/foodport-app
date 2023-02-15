import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TotalPageVisitChart extends StatelessWidget {
  const TotalPageVisitChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          topTitles: AxisTitles(),
          bottomTitles: AxisTitles(
            axisNameWidget:
                Text("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"),
          ),
          rightTitles: AxisTitles(),
        ),
        gridData: FlGridData(
          horizontalInterval: 10,
          drawVerticalLine: false,
        ),
        lineBarsData: [
          // 1st Line
          LineChartBarData(
            spots: [
              FlSpot(1, 10),
              FlSpot(2, 30),
              FlSpot(3, 50),
              FlSpot(4, 30),
              FlSpot(5, 80),
              FlSpot(6, 40),
              FlSpot(7, 70),
              FlSpot(8, 30),
              FlSpot(9, 90),
              FlSpot(10, 80),
              FlSpot(11, 50),
              FlSpot(12, 80),
            ],
          ),
        ],
      ),
    );
  }
}
