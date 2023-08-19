import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/getx/auth/biometric/qr_sacnner_controller.dart';
import 'package:synapsis_intern/presentation/constants/auth/auth_local/qr_scanner_status.dart';

class QrScannerDialog {
  const QrScannerDialog._();

  static void succes() {
    final qrController = Get.put(QRScannerController());
    Get.defaultDialog(
        title: 'Succes Get Data',
        content: const Text(
          'We have finished retrieve data form QR Code',
          textAlign: TextAlign.center,
        ),
        actions: [
          ElevatedButton(
              onPressed: () async {
                Get.back();
                Get.back();
                qrController.qrStatus.value = QRScannerStatus.end;
                await Future.delayed(const Duration(seconds: 2));
                qrController.qrStatus.value = QRScannerStatus.start;
              },
              child: const Text('Kembali ke Biometric page'))
        ]);
  }

  static void failed() {
    final qrController = Get.put(QRScannerController());
    Get.defaultDialog(
        title: 'Succes Get Data',
        content: const Text(
          'We have finished retrieve data form QR Code',
          textAlign: TextAlign.center,
        ),
        actions: [
          ElevatedButton(
              onPressed: () async {
                Get.back();
                await Future.delayed(const Duration(seconds: 1));
                qrController.qrStatus.value = QRScannerStatus.end;
                qrController.qrStatus.value = QRScannerStatus.start;
              },
              child: const Text('Kembali ke Biometric page'))
        ]);
  }
}
