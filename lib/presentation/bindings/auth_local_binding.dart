import 'package:get/get.dart';
import 'package:synapsis_intern/getx/auth/biometric/biometric_controller.dart';

class AuthLocalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BiometricController());
  }
}
