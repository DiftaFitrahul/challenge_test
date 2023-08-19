import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/getx/auth/biometric/biometric_controller.dart';
import 'package:synapsis_intern/getx/auth/biometric/qr_sacnner_controller.dart';
import 'package:synapsis_intern/presentation/constants/auth/auth_local/qr_scanner_status.dart';
import 'package:synapsis_intern/presentation/routes/route_name.dart';

class AuthBiometricAndQRcode extends StatelessWidget {
  const AuthBiometricAndQRcode({super.key});

  @override
  Widget build(BuildContext context) {
    final biometricController = Get.find<BiometricController>();
    final qrScannerController = Get.find<QRScannerController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map GPS Page'),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                biometricController.isSupportedBiometricAuth.value
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'The device support biometric authentication',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'The device does not support biometric authentication',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => Column(
                      children: [
                        ...biometricController.biometricType
                            .map((element) => Text(
                                  element.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ))
                            .toList()
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {
                      biometricController.getAvailableBiometricAuthentication();
                    },
                    child: const Text('Get available biometrics')),
                Obx(
                  () => biometricController.authenticateUserStatus.value
                      ? const Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                            'Authenticated',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                            'Not Authenticated',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                ),
                ElevatedButton(
                    onPressed: () {
                      biometricController.authenticate();
                    },
                    child: const Text('authenticate')),
                const SizedBox(
                  height: 50,
                ),
                Obx(() => qrScannerController.qrValue.isEmpty
                    ? const Text(
                        'QR Result: kosong',
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        'QR Result: ${qrScannerController.qrValue.value}',
                        textAlign: TextAlign.center,
                      )),
                ElevatedButton(
                    onPressed: () {
                      qrScannerController.qrStatus.value =
                          QRScannerStatus.start;
                      Get.toNamed(RoutesName.qrScannerPage);
                    },
                    child: const Text('Scan QR')),
                Text(
                  'Actually i dont understand about login with QR code, \n Usually QR Code is for payment, presence, and etc \n i dont understand in how to use QR Code to login when we havent signin anymore, we know that QR Code only give us a data\nSo in this case i will use scanner to get qr data',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
