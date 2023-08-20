import 'dart:async';
import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:synapsis_intern/data/models/first_page/magnetometer.dart';
import 'package:synapsis_intern/getx/bonus_page/camera_description_controller.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';

class BonusPageController extends GetxController {
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  Rx<MagnetometerModel> magnetometerModel =
      Get.put(FirstPageController()).magnetometerModel;
  StreamSubscription<Position>? hasil;
  RxString dateNow = ''.obs;
  final RxList<CameraDescription> cameraDescription =
      Get.put(CameraInitializeController()).cameras;

  @override
  void onInit() async {
    //Timer to get current DateTime
    Timer.periodic(const Duration(milliseconds: 980), (timer) {
      dateNow.value =
          DateFormat('EEEE, MMM d, yyyy H:mm:s').format(DateTime.now());
    });

    super.onInit();
  }

  Future<void> getLocation() async {
    //request and location
    await Permission.location.request();

    //Set location accuracy
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    //Get stream of latitude and longitude
    hasil = Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      latitude.value = position?.latitude ?? 0;
      longitude.value = position?.longitude ?? 0;
    });
  }

  @override
  void onClose() {
    hasil?.cancel();
    super.onClose();
  }
}
