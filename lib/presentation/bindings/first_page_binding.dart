import 'package:get/get.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';

class FirstPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FirstPageController());
  }
}
