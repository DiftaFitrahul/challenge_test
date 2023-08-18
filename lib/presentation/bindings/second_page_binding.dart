import 'package:get/get.dart';
import 'package:synapsis_intern/getx/second_page/second_page_controller.dart';

class SecondPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SecondPageController());
  }
}
