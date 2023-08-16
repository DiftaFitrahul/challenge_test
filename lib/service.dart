import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

final textProvider = StateProvider<String>((ref) => '');

class TextController extends GetxController {
  RxString data = ''.obs;

  void change(String newValue) {
    data.value = newValue;
  }
}
