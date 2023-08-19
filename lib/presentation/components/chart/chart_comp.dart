import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:synapsis_intern/presentation/components/chart/line_chart_bar_data.dart';

class ChartComp extends StatelessWidget {
  final String title;

  final double minY;
  final double maxY;
  final double minX;
  final double maxX;
  final List<FlSpot>? flspotX;
  final List<FlSpot>? flspotY;
  final List<FlSpot>? flspotZ;

  const ChartComp(
      {super.key,
      required this.title,
      required this.minY,
      required this.maxY,
      required this.minX,
      required this.maxX,
      this.flspotX,
      this.flspotY,
      this.flspotZ});
  final Color xColor = Colors.blue;
  final Color yColor = Colors.pink;
  final Color zColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 5),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            color: Colors.blue,
          ),
          const Text(' = X'),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 10,
            height: 10,
            color: Colors.pink,
          ),
          const Text(' = Y'),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 10,
            height: 10,
            color: Colors.green,
          ),
          const Text(' = Z'),
        ],
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2, bottom: 5),
            child: Text(
              'Y-axis is a value   X-axis is timestamp',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
      AspectRatio(
          aspectRatio: 1.5,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 20, left: 20),
              child: LineChart(LineChartData(
                minY: minY,
                maxY: maxY,
                minX: minX,
                maxX: maxX,
                lineTouchData: const LineTouchData(enabled: false),
                clipData: const FlClipData.all(),
                gridData: const FlGridData(show: true),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarDataComp.line(flspotX ?? [], xColor),
                  LineChartBarDataComp.line(flspotY ?? [], yColor),
                  LineChartBarDataComp.line(flspotZ ?? [], zColor),
                ],
                titlesData: const FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 36,
                    ))),
              ))))
    ]);
  }
}
