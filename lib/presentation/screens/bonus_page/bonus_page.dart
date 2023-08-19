import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/getx/bonus_page/bonus_page_controller.dart';
import 'package:synapsis_intern/presentation/components/bonus_page/floating_title.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({super.key});

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  final cameraController = Get.find<BonusPageController>();
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
        cameraController.cameraDescription[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bonus Page'),
      ),
      body: Stack(
        children: [
          controller.value.isInitialized
              ? CameraPreview(controller)
              : Container(),
          Obx(() => Align(
              alignment: const Alignment(1, -0.99),
              child: FloatingTitle(
                  title: 'DateTime: ${cameraController.dateNow}'))),
          Obx(() => Align(
              alignment: const Alignment(1, -0.86),
              child: FloatingTitle(
                  title:
                      'latitude: ${cameraController.latitude} longitude: ${cameraController.longitude}'))),
          Obx(() => Align(
              alignment: const Alignment(1, -0.72),
              child: FloatingTitle(
                  title:
                      'Magneto-X: ${cameraController.magnetometerModel.value.X}\nMagneto-Y: ${cameraController.magnetometerModel.value.Y}\nMagneto-Z: ${cameraController.magnetometerModel.value.Z}')))
        ],
      ),
    );
  }
}
