import 'package:hive/hive.dart';
import 'package:synapsis_intern/data/models/crud_page/crud_model.dart';

class CrudService {
  const CrudService._();
  static Future<void> add(
      {required List<CRUDMod> data,
      required Box<List> box,
      required String key}) async {
    await box.put(key, data);
  }

  static Future<void> update(
      {required List<CRUDMod> data,
      required Box<List> box,
      required String key}) async {
    await box.put(key, data);
  }

  static List? get({required Box<List> box, required String key}) {
    return box.get(key);
  }
}
