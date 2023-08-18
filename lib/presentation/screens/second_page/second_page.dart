import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/getx/second_page/second_page_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final secondPageController = Get.find<SecondPageController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'SOC Info',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    'Manufacture: ${secondPageController.socModel.value.manufacture}\nModel: ${secondPageController.socModel.value.model}\nBuild: ${secondPageController.socModel.value.build}\nSDK Version Code: ${secondPageController.socModel.value.sdkVersionCode}\nCodeName: ${secondPageController.socModel.value.codeName}',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
