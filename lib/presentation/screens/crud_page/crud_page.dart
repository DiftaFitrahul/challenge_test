import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/data/models/crud_page/crud_model.dart';
import 'package:synapsis_intern/data/models/crud_page/crud_page_model.dart';
import 'package:synapsis_intern/getx/auth/username/username_controller.dart';
import 'package:synapsis_intern/getx/crud_page/crud_page_controller.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';
import 'package:synapsis_intern/presentation/routes/route_name.dart';
import 'package:synapsis_intern/presentation/screens/third_page/third_page.dart';

class CrudPage extends StatelessWidget {
  const CrudPage({super.key});

  @override
  Widget build(BuildContext context) {
    final crudController = Get.find<CrudPageController>();
    final usernameController = Get.find<UserNameController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Crud Page'),
      ),
      body: Center(
          child: Obx(
        () => ListView.builder(
            itemCount: crudController.listCRUDMod.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                    crudController.listCRUDMod[index].text,
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    crudController.listCRUDMod[index].date,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: () {
                    crudController.textController.value.text =
                        crudController.listCRUDMod[index].text;
                    Get.defaultDialog(
                        contentPadding:
                            const EdgeInsets.only(top: 8, bottom: 10),
                        titlePadding: const EdgeInsets.all(18),
                        title: 'Input Text',
                        content: Obx(
                          () => SizedBox(
                            width: 200,
                            child: TextField(
                              controller: crudController.textController.value,
                            ),
                          ),
                        ),
                        barrierDismissible: false,
                        actions: [
                          SizedBox(
                            width: 80,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: const BorderSide(
                                            width: 1, color: Colors.blue))),
                                onPressed: () {
                                  Get.back();
                                  crudController.textController.value.text = '';
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.blue[800]),
                                )),
                          ),
                          SizedBox(
                            width: 80,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                onPressed: () {
                                  if (crudController
                                      .textController.value.text.isEmpty) {
                                    crudController.emptyInput.value = true;
                                  } else {
                                    crudController.emptyInput.value = false;
                                    crudController
                                        .updateData(
                                            CRUDMod(
                                                date: DateTime.now().toString(),
                                                text: crudController
                                                    .textController.value.text),
                                            usernameController.username.value,
                                            index)
                                        .then((value) {
                                      crudController.getTask(
                                          usernameController.username.value);
                                      Get.back();
                                      crudController.textController.value.text =
                                          '';
                                    });
                                  }
                                },
                                child: const Text(
                                  'update',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                )),
                          )
                        ]);
                  },
                  trailing: IconButton(
                      onPressed: () {
                        crudController.deleteData(
                            usernameController.username.value, index);
                      },
                      icon: const Icon(CupertinoIcons.delete)),
                )),
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 30),
                      backgroundColor: Colors.blueGrey),
                  onPressed: () {
                    Get.toNamed(RoutesName.thirdPage);
                  },
                  child: const Text(
                    'Go to third page',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
              ),
              child: FloatingActionButton(
                elevation: 3,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(width: 1, color: Colors.blue)),
                onPressed: () {
                  Get.defaultDialog(
                      contentPadding: const EdgeInsets.only(top: 8, bottom: 10),
                      titlePadding: const EdgeInsets.all(18),
                      title: 'Input Text',
                      content: Obx(
                        () => SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                                errorText: crudController.emptyInput.value
                                    ? 'Input can not be empty'
                                    : null),
                            controller: crudController.textController.value,
                          ),
                        ),
                      ),
                      barrierDismissible: false,
                      actions: [
                        SizedBox(
                          width: 80,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: const BorderSide(
                                          width: 1, color: Colors.blue))),
                              onPressed: () {
                                Get.back();
                                crudController.textController.value.text = '';
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.blue[800]),
                              )),
                        ),
                        SizedBox(
                          width: 80,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              onPressed: () {
                                if (crudController
                                    .textController.value.text.isEmpty) {
                                  crudController.emptyInput.value = true;
                                } else {
                                  crudController.emptyInput.value = false;
                                  crudController
                                      .add(
                                          CRUDMod(
                                              date: DateTime.now().toString(),
                                              text: crudController
                                                  .textController.value.text),
                                          usernameController.username.value)
                                      .then((value) {
                                    crudController.getTask(
                                        usernameController.username.value);
                                    Get.back();
                                    crudController.textController.value.text =
                                        '';
                                  });
                                }
                              },
                              child: const Text(
                                'Add',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              )),
                        )
                      ]);
                },
                child: Icon(
                  Icons.add,
                  color: Colors.blue[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
