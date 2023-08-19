import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:synapsis_intern/getx/auth/username/username_controller.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';
import 'package:synapsis_intern/presentation/components/first_page/sensor_value.dart';
import 'package:synapsis_intern/presentation/components/first_page/text_comp.dart';
import 'package:synapsis_intern/presentation/routes/route_name.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fisrtController = Get.find<FirstPageController>();
    final userNameController = Get.find<UserNameController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('First Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Text(
                  "Hello ${userNameController.username}",
                  style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 21,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: StreamBuilder(
                    stream: Stream.periodic(const Duration(milliseconds: 970)),
                    builder: (context, snapshot) {
                      return Text(
                        DateFormat('H:mm:s').format(DateTime.now()),
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      );
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                  style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Location Info',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() => Text(
                    fisrtController.getLocationLoading.value
                        ? 'latitude: Loading...\nlongitude: Loading...'
                        : 'latitude: ${fisrtController.locationModel.value.latitude ?? 'empty'}\nlongitude: ${fisrtController.locationModel.value.longitude ?? 'empty'}',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  )),
              ElevatedButton(
                  onPressed: () {
                    fisrtController.getLocation();
                  },
                  child: const Text('Get Current Location')),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Battery Info',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextComp(
                          title:
                              "Battery capacity: ${fisrtController.batteryInfo.value.capacity}",
                        ),
                        TextComp(
                          title:
                              "Battery level: ${fisrtController.batteryInfo.value.level}",
                        ),
                        TextComp(
                          title:
                              "Charge time remaining: ${fisrtController.batteryInfo.value.chargeTimeRemaining}",
                        ),
                        TextComp(
                          title:
                              "Charging status: ${fisrtController.batteryInfo.value.chargingStatus}",
                        ),
                        TextComp(
                          title:
                              "Current Average: ${fisrtController.batteryInfo.value.currentAverage}",
                        ),
                        TextComp(
                          title:
                              "Current now: ${fisrtController.batteryInfo.value.currentNow}",
                        ),
                        TextComp(
                            title:
                                "Battery health: ${fisrtController.batteryInfo.value.health}"),
                        TextComp(
                          title:
                              "Battery temperature: ${fisrtController.batteryInfo.value.temperature}",
                        ),
                        TextComp(
                          title:
                              "Battery voltage: ${fisrtController.batteryInfo.value.voltage}",
                        ),
                      ],
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Accelerometer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() => SensorComp(
                    title:
                        'X: ${fisrtController.accelerometerModel.value.X}\nY: ${fisrtController.accelerometerModel.value.Y}\nZ: ${fisrtController.accelerometerModel.value.Z}',
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Gyroscope',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() => SensorComp(
                    title:
                        'X: ${fisrtController.gyroscopeModel.value.X}\nY: ${fisrtController.gyroscopeModel.value.Y}\nZ: ${fisrtController.gyroscopeModel.value.Z}',
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Magnetometer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() => SensorComp(
                    title:
                        'X: ${fisrtController.magnetometerModel.value.X}\nY: ${fisrtController.magnetometerModel.value.Y}\nZ: ${fisrtController.magnetometerModel.value.Z}',
                  )),
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
                    Get.toNamed(RoutesName.secondPage);
                  },
                  child: const Text(
                    'Go To Second Page',
                    style: TextStyle(fontSize: 18),
                  )),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
