import 'package:get/get.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';
import 'package:synapsis_intern/getx/third_page/chart_controller.dart';

class ThirdPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChartController());
    Get.put(FirstPageController());
  }
}
