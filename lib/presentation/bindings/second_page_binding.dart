import 'package:get/get.dart';
import 'package:synapsis_intern/getx/auth/username/username_controller.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';
import 'package:synapsis_intern/getx/second_page/second_page_controller.dart';

class SecondPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SecondPageController());
    Get.put(FirstPageController());
    Get.put(UserNameController());
  }
}
