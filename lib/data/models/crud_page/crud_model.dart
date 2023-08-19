import 'package:hive/hive.dart';

part 'crud_model.g.dart';

@HiveType(typeId: 1)
class CRUDMod {
  @HiveField(0)
  String text;

  @HiveField(1)
  String date;

  CRUDMod({required this.text, required this.date});
}
