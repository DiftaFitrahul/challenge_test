import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartBarDataComp {
  const LineChartBarDataComp._();
  static LineChartBarData line(List<FlSpot> points, color) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [color.withOpacity(0.0), color],
        stops: const [.1, 1],
      ),
      barWidth: 2,
      isCurved: false,
    );
  }
}
