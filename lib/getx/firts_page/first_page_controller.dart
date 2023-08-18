import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:synapsis_intern/data/models/first_page/battery_info.dart';
import 'package:synapsis_intern/data/models/first_page/location.dart';

class FirstPageController extends GetxController {
  Rx<BatteryInfo> batteryInfo = BatteryInfo().obs;
  Rx<LocationModel> locationModel = LocationModel().obs;
  RxBool getLocationLoading = false.obs;

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
}
