import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';
import 'package:synapsis_intern/getx/third_page/chart_controller.dart';
import 'package:synapsis_intern/presentation/components/chart/chart_comp.dart';
import 'package:synapsis_intern/presentation/routes/route_name.dart';

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
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
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
                      title: 'Accelerometer',
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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            backgroundColor: Colors.green,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          Get.toNamed(RoutesName.authBioPage);
                        },
                        child: const Text(
                          'Go To Local Auth',
                          style: TextStyle(fontSize: 18),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ))),
      ),
    );
  }
}
