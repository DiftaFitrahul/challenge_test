import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:synapsis_intern/getx/auth/biometric/qr_sacnner_controller.dart';
import 'package:synapsis_intern/presentation/components/qr_scanner_dialog/qr_sacnner_dialog.dart';
import 'package:synapsis_intern/presentation/constants/auth/auth_local/qr_scanner_status.dart';

class QrScannerPage extends StatelessWidget {
  const QrScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    final qrScannerController = Get.find<QRScannerController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scan QR'),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: QRView(
          key: qrKey,
          onQRViewCreated: (controller) async {
            controller.scannedDataStream.listen((dataQR) async {
              if (qrScannerController.qrStatus.value == QRScannerStatus.start) {
                qrScannerController.qrStatus.value = QRScannerStatus.getting;
                if (dataQR.code != null && dataQR.code!.isNotEmpty) {
                  qrScannerController.qrValue.value = dataQR.code ?? '';
                  QrScannerDialog.succes();
                } else {
                  QrScannerDialog.failed();
                }
              }
            });
          },
          overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: 320,
          ),
        ));
  }
}
