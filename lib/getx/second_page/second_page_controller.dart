import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/data/models/first_page/gyroscope.dart';
import 'package:synapsis_intern/data/models/second_page/soc_info.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';

class SecondPageController extends GetxController {
  RxBool data = false.obs;
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Rx<SOCInfoModel> socModel = SOCInfoModel().obs;
  Rx<TextEditingController> controller = TextEditingController().obs;
  RxString dataQR = ''.obs;
  Rx<GyroscopeModel> modelGyroscope = GyroscopeModel().obs;
  Rx<TextEditingController> refreshRateController = TextEditingController().obs;

  @override
  void onInit() async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    socModel.update(
      (val) {
        socModel.value.manufacture = androidInfo.manufacturer;
        socModel.value.model = androidInfo.model;
        socModel.value.build = androidInfo.version.release;
        socModel.value.sdkVersionCode = androidInfo.version.sdkInt;
        socModel.value.codeName = androidInfo.version.codename;
      },
    );

    super.onInit();
  }
}
