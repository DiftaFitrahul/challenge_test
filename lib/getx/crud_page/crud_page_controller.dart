import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:synapsis_intern/data/models/crud_page/crud_model.dart';
import 'package:synapsis_intern/data/service/crud_operation/crud_service.dart';

class CrudPageController extends GetxController {
  RxList<CRUDMod> listCRUDMod = <CRUDMod>[].obs;
  Rx<TextEditingController> textController = TextEditingController().obs;
  RxBool emptyInput = false.obs;

  late Box<List> dataBox;

  @override
  void onInit() {
    dataBox = Hive.box('crud');

    super.onInit();
  }

  Future<void> add(CRUDMod model, String username) async {
    listCRUDMod.add(model);
    await CrudService.add(data: listCRUDMod, box: dataBox, key: username);
  }

  Future<void> updateData(CRUDMod model, String username, int index) async {
    listCRUDMod[index] = model;
    await CrudService.update(data: listCRUDMod, box: dataBox, key: username);
  }

  Future<void> deleteData(String username, int index) async {
    listCRUDMod.removeAt(index);

    await CrudService.update(data: listCRUDMod, box: dataBox, key: username);
  }

  void getTask(String username) {
    final data = CrudService.get(box: dataBox, key: username);
    if (data != null) {
      List<CRUDMod> newList =
          data.map((e) => CRUDMod(text: e.text, date: e.date)).toList();
      listCRUDMod.value = [];
      listCRUDMod.addAll(newList);
    }
  }
}
