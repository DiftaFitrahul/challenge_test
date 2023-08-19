import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';
import 'package:synapsis_intern/getx/third_page/chart_controller.dart';
import 'package:synapsis_intern/presentation/components/chart/chart_comp.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});
  final Color xColor = Colors.blue;
  final Color yColor = Colors.pink;
  final Color zColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    final chartController = Get.find<ChartController>();
    final firstPageController = Get.find<FirstPageController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Obx(() => Column(
                      children: [
                        ChartComp(
                          title: 'Magnetometer',
                          minY: -70,
                          maxY: 70,
                          minX: firstPageController.startChart.value
                              ? chartController.timeStampMagneto.first
                              : 0,
                          maxX: firstPageController.startChart.value
                              ? chartController.timeStampMagneto.last
                              : 1,
                          flspotX: chartController.magnetometerX,
                          flspotY: chartController.magnetometerY,
                          flspotZ: chartController.magnetometerZ,
                        ),
                        ChartComp(
                          title: 'Accelero',
                          minY: -12,
                          maxY: 12,
                          minX: firstPageController.startChart.value
                              ? chartController.timeStampAccelero.first
                              : 0,
                          maxX: firstPageController.startChart.value
                              ? chartController.timeStampAccelero.last
                              : 1,
                          flspotX: chartController.accelerometerX,
                          flspotY: chartController.accelerometerY,
                          flspotZ: chartController.accelerometerZ,
                        ),
                        ChartComp(
                          title: 'Gyroscope',
                          minY: -9,
                          maxY: 9,
                          minX: firstPageController.startChart.value
                              ? chartController.timeStampGyro.first
                              : 0,
                          maxX: firstPageController.startChart.value
                              ? chartController.timeStampGyro.last
                              : 1,
                          flspotX: chartController.gyroscopeX,
                          flspotY: chartController.gyroscopeY,
                          flspotZ: chartController.gyroscopeZ,
                        )
                      ],
                    )
                //Column(children: [
                //   const Padding(
                //     padding: EdgeInsets.only(top: 25, bottom: 5),
                //     child: Text(
                //       'Magnetometer',
                //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         width: 10,
                //         height: 10,
                //         color: Colors.blue,
                //       ),
                //       const Text(' = X'),
                //       const SizedBox(
                //         width: 15,
                //       ),
                //       Container(
                //         width: 10,
                //         height: 10,
                //         color: Colors.pink,
                //       ),
                //       const Text(' = Y'),
                //       const SizedBox(
                //         width: 15,
                //       ),
                //       Container(
                //         width: 10,
                //         height: 10,
                //         color: Colors.green,
                //       ),
                //       const Text(' = Z'),
                //     ],
                //   ),
                //   const Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(top: 2, bottom: 5),
                //         child: Text(
                //           'Y-axis is a value   X-axis is timestamp',
                //           style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                //         ),
                //       ),
                //     ],
                //   ),
                //   AspectRatio(
                //       aspectRatio: 1.5,
                //       child: Padding(
                //           padding:
                //               const EdgeInsets.only(bottom: 25, top: 20, left: 20),
                //           child: LineChart(LineChartData(
                //             minY: -70,
                //             maxY: 70,
                //             minX: firstPageController.startChart.value
                //                 ? chartController.timeStamp.first
                //                 : 0,
                //             maxX: firstPageController.startChart.value
                //                 ? chartController.timeStamp.last
                //                 : 1,
                //             lineTouchData: const LineTouchData(enabled: false),
                //             clipData: const FlClipData.all(),
                //             gridData: const FlGridData(show: true),
                //             borderData: FlBorderData(show: false),
                //             lineBarsData: [
                //               xline(chartController.magnetometerX),
                //               yLine(chartController.magnetometerY),
                //               zLine(chartController.magnetometerZ),
                //             ],
                //             titlesData: const FlTitlesData(
                //                 topTitles: AxisTitles(
                //                   sideTitles: SideTitles(showTitles: false),
                //                 ),
                //                 rightTitles: AxisTitles(
                //                   sideTitles: SideTitles(showTitles: false),
                //                 ),
                //                 leftTitles: AxisTitles(
                //                     sideTitles: SideTitles(
                //                   showTitles: true,
                //                   reservedSize: 36,
                //                 ))),
                //           ))))
                // ]),
                )),
      ),
    );
  }

  LineChartBarData xline(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [xColor.withOpacity(0), xColor],
        stops: const [.1, 1],
      ),
      barWidth: 2,
      isCurved: false,
    );
  }

  LineChartBarData yLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [yColor.withOpacity(0), yColor],
        stops: const [.1, 1],
      ),
      barWidth: 2,
      isCurved: false,
    );
  }

  LineChartBarData zLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(show: false),
      gradient: LinearGradient(
        colors: [zColor.withOpacity(0), zColor],
        stops: const [.1, 1],
      ),
      barWidth: 2,
      isCurved: false,
    );
  }
}
