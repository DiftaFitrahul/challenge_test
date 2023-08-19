import 'package:get/get.dart';
import 'package:synapsis_intern/getx/auth/username/username_controller.dart';
import 'package:synapsis_intern/getx/crud_page/crud_page_controller.dart';

class CrudPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CrudPageController());
    Get.put(UserNameController());
  }
}
