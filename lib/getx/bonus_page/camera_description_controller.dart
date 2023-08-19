import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraInitializeController extends GetxController {
  RxList<CameraDescription> cameras = <CameraDescription>[].obs;

  //Initialize camera Description
  Future<void> initializeCameraDescription() async {
    cameras.value = await availableCameras();
  }
}
