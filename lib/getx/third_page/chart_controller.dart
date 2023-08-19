import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/data/models/first_page/accelerometer.dart';
import 'package:synapsis_intern/data/models/first_page/gyroscope.dart';
import 'package:synapsis_intern/data/models/first_page/magnetometer.dart';

class ChartController extends GetxController {
  RxInt limit = 100.obs;
  RxList<FlSpot> magnetometerX = <FlSpot>[].obs;
  RxList<FlSpot> magnetometerY = <FlSpot>[].obs;
  RxList<FlSpot> magnetometerZ = <FlSpot>[].obs;
  RxList<double> timeStampMagneto = <double>[].obs;
  double magneto = 0;

  RxList<FlSpot> accelerometerX = <FlSpot>[].obs;
  RxList<FlSpot> accelerometerY = <FlSpot>[].obs;
  RxList<FlSpot> accelerometerZ = <FlSpot>[].obs;
  RxList<double> timeStampAccelero = <double>[].obs;
  double accelero = 0;

  RxList<FlSpot> gyroscopeX = <FlSpot>[].obs;
  RxList<FlSpot> gyroscopeY = <FlSpot>[].obs;
  RxList<FlSpot> gyroscopeZ = <FlSpot>[].obs;
  RxList<double> timeStampGyro = <double>[].obs;
  double gyro = 0;

  void magnetoStart(
      {required double refreshRate, required MagnetometerModel model}) {
    if (refreshRate == 0) {
      refreshRate = 0.0001;
    }
    magneto += refreshRate;
    if (magnetometerX.length > limit.value - 1) {
      timeStampMagneto.removeAt(0);
      magnetometerX.removeAt(0);
      magnetometerY.removeAt(0);
      magnetometerZ.removeAt(0);
    }

    magnetometerX.add(FlSpot(magneto, model.X ?? 0));
    magnetometerY.add(FlSpot(magneto, model.Y ?? 0));
    magnetometerZ.add(FlSpot(magneto, model.Z ?? 0));
    timeStampMagneto.add(magneto);
  }

  void acceleroStart(
      {required double refreshRate, required AccelerometerModel model}) {
    if (refreshRate == 0) {
      refreshRate = 0.0001;
    }
    accelero += refreshRate;

    if (accelerometerX.length > limit.value - 1) {
      timeStampAccelero.removeAt(0);
      accelerometerX.removeAt(0);
      accelerometerY.removeAt(0);
      accelerometerZ.removeAt(0);
    }

    accelerometerX.add(FlSpot(accelero, model.X ?? 0));
    accelerometerY.add(FlSpot(accelero, model.Y ?? 0));
    accelerometerZ.add(FlSpot(accelero, model.Z ?? 0));
    timeStampAccelero.add(accelero);
  }

  void gyroStart({required double refreshRate, required GyroscopeModel model}) {
    if (refreshRate == 0) {
      refreshRate = 0.0001;
    }

    gyro += refreshRate;
    if (gyroscopeX.length > limit.value - 1) {
      timeStampGyro.removeAt(0);
      gyroscopeX.removeAt(0);
      gyroscopeY.removeAt(0);
      gyroscopeZ.removeAt(0);
    }

    gyroscopeX.add(FlSpot(gyro, model.X ?? 0));
    gyroscopeY.add(FlSpot(gyro, model.Y ?? 0));
    gyroscopeZ.add(FlSpot(gyro, model.Z ?? 0));
    timeStampGyro.add(gyro);
  }
}
