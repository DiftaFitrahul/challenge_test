import 'package:get/get.dart';
import 'package:synapsis_intern/getx/auth/biometric/biometric_controller.dart';
import 'package:synapsis_intern/getx/auth/biometric/qr_sacnner_controller.dart';

class AuthLocalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BiometricController(), permanent: true);
    Get.put(QRScannerController(), permanent: true);
  }
}
