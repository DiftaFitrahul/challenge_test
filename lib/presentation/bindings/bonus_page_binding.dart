import 'package:get/get.dart';
import 'package:synapsis_intern/getx/bonus_page/bonus_page_controller.dart';
import 'package:synapsis_intern/getx/bonus_page/camera_description_controller.dart';

class BonusPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BonusPageController());
    Get.put(CameraInitializeController());
  }
}
