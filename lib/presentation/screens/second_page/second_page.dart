import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';
import 'package:synapsis_intern/getx/second_page/second_page_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firstPageController = Get.find<FirstPageController>();
    final secondPageController = Get.find<SecondPageController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'SOC Info',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    'Manufacture: ${secondPageController.socModel.value.manufacture}\nModel: ${secondPageController.socModel.value.model}\nBuild: ${secondPageController.socModel.value.build}\nSDK Version Code: ${secondPageController.socModel.value.sdkVersionCode}\nCodeName: ${secondPageController.socModel.value.codeName}',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 5),
                child: Text(
                  'Generate QR',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 2, bottom: 5),
                child: Text(
                  'if user input empty field, it would not generate qr',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: TextField(
                  controller: secondPageController.controller.value,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    secondPageController.dataQR.value =
                        secondPageController.controller.value.text;
                  },
                  child: const Text('Generate qr')),
              Obx(() => secondPageController.dataQR.value.isEmpty
                  ? Container()
                  : QrImageView(
                      data: secondPageController.dataQR.value,
                      version: 10,
                      size: 320,
                      gapless: false,
                    )),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Update Refresh Rate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 2, bottom: 5),
                child: Text(
                  'the input type is second, if user do not input anyting, it will set 0',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: secondPageController.refreshRateController.value,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  int updateRefreshRate = secondPageController
                          .refreshRateController.value.text.isEmpty
                      ? 0
                      : int.parse(secondPageController
                          .refreshRateController.value.text);
                  firstPageController.getAccelerometerWithRefreshRate(
                      second: updateRefreshRate);
                  firstPageController.getGyroscopeWithRefreshRate(
                      second: updateRefreshRate);
                  firstPageController.getMagnetometerWithRefreshRate(
                      second: updateRefreshRate);
                },
                child: const Text('Update Refresh Rate'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Accelerometer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    'X: ${firstPageController.accelerometerModelRefreshRate.value.X}\nY: ${firstPageController.accelerometerModelRefreshRate.value.Y}\nZ: ${firstPageController.accelerometerModelRefreshRate.value.Z}',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Gyroscope',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    'X: ${firstPageController.gyroscopeModelRefreshRate.value.X}\nY: ${firstPageController.gyroscopeModelRefreshRate.value.Y}\nZ: ${firstPageController.gyroscopeModelRefreshRate.value.Z}',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Magnetometer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    'X: ${firstPageController.magnetometerModelRefreshRate.value.X}\nY: ${firstPageController.magnetometerModelRefreshRate.value.Y}\nZ: ${firstPageController.magnetometerModelRefreshRate.value.Z}',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
