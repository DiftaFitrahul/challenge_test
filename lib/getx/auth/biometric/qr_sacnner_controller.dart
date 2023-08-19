import 'package:get/get.dart';
import 'package:synapsis_intern/presentation/constants/auth/auth_local/qr_scanner_status.dart';

class QRScannerController extends GetxController {
  Rx<QRScannerStatus> qrStatus = QRScannerStatus.start.obs;
  RxString qrValue = ''.obs;
}
