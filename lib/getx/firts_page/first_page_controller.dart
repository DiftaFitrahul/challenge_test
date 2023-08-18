import 'dart:math';

import 'package:battery_info/battery_info_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:synapsis_intern/data/models/first_page/accelerometer.dart';
import 'package:synapsis_intern/data/models/first_page/battery_info.dart';
import 'package:synapsis_intern/data/models/first_page/gyroscope.dart';
import 'package:synapsis_intern/data/models/first_page/location.dart';
import 'package:synapsis_intern/data/models/first_page/magnetometer.dart';

class FirstPageController extends GetxController {
  Rx<BatteryInfo> batteryInfo = BatteryInfo().obs;
  Rx<LocationModel> locationModel = LocationModel().obs;
  RxBool getLocationLoading = false.obs;
  Rx<AccelerometerModel> accelerometerModel = AccelerometerModel().obs;
  Rx<GyroscopeModel> gyroscopeModel = GyroscopeModel().obs;
  Rx<MagnetometerModel> magnetometerModel = MagnetometerModel().obs;

  //instantiate it

  void getDataInfoBattery() async {
    BatteryInfoPlugin().androidBatteryInfoStream.listen(
      (event) {
        batteryInfo.update(
          (val) {
            batteryInfo.value.capacity = event?.batteryCapacity;
            batteryInfo.value.chargeTimeRemaining = event?.chargeTimeRemaining;
            batteryInfo.value.chargingStatus = event?.chargingStatus.toString();
            batteryInfo.value.level = event?.batteryLevel;
            batteryInfo.value.currentAverage = event?.currentAverage;
            batteryInfo.value.currentNow = event?.currentNow;
            batteryInfo.value.health = event?.health;
            batteryInfo.value.temperature = event?.temperature;
            batteryInfo.value.voltage = event?.voltage;
          },
        );
      },
    );
  }

  void getLocation() async {
    getLocationLoading.value = true;
    await Permission.location.request();
    final location = await Geolocator.getCurrentPosition();
    getLocationLoading.value = false;
    locationModel.update((val) {
      locationModel.value.latitude = location.latitude;
      locationModel.value.longitude = location.longitude;
    });
  }

  void getMagnetometer() {
    magnetometerEvents.listen(
      (MagnetometerEvent event) {
        magnetometerModel.update((val) {
          magnetometerModel.value.X = event.x;
          magnetometerModel.value.Y = event.y;
          magnetometerModel.value.Z = event.z;
        });
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
// [MagnetometerEvent (x: -23.6, y: 6.2, z: -34.9)]
  }

  void getGyroscope() {
    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        gyroscopeModel.update((val) {
          gyroscopeModel.value.X = event.x;
          gyroscopeModel.value.Y = event.y;
          gyroscopeModel.value.Z = event.z;
        });
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
  }

  void getAccelerometer() {
    accelerometerEvents.listen(
      (AccelerometerEvent event) {
        accelerometerModel.update((val) {
          accelerometerModel.value.X = event.x;
          accelerometerModel.value.Y = event.y;
          accelerometerModel.value.Z = event.z;
        });
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
  }
}
