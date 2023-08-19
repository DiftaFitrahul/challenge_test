import 'package:get/get.dart';
import 'package:synapsis_intern/getx/auth/biometric/qr_sacnner_controller.dart';

class QRScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(QRScannerController(), permanent: true);
  }
}
