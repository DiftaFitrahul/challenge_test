import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fisrtController = Get.find<FirstPageController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: StreamBuilder(
                  stream: Stream.periodic(const Duration(milliseconds: 970)),
                  builder: (context, snapshot) {
                    return Text(
                      DateFormat('hh:mm:ss').format(DateTime.now()),
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
                      Text(
                        "Battery capacity: ${fisrtController.batteryInfo.value.capacity}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Battery level: ${fisrtController.batteryInfo.value.level}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Charge time remaining: ${fisrtController.batteryInfo.value.chargeTimeRemaining}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Charging status: ${fisrtController.batteryInfo.value.chargingStatus}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Current Average: ${fisrtController.batteryInfo.value.currentAverage}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Current now: ${fisrtController.batteryInfo.value.currentNow}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Battery health: ${fisrtController.batteryInfo.value.health}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Battery temperature: ${fisrtController.batteryInfo.value.temperature}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Battery voltage: ${fisrtController.batteryInfo.value.voltage}",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
