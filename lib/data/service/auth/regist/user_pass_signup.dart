import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:synapsis_intern/data/models/auth/login/user_pass_model.dart';
import 'package:synapsis_intern/presentation/constants/auth/regist/user_pass_regist_const.dart';

class UserPassRegistService {
  const UserPassRegistService._();
  static Future<UserPassRegistResult> regist(
      {required UserPassModel data, required Box<String> box}) async {
    final dataSignUp = box.get(data.username);
    if (dataSignUp != null && dataSignUp.isNotEmpty) {
      return UserPassRegistResult.usernameExisted;
    } else {
      await box.put(data.username, jsonEncode(data.toJson()));
      return UserPassRegistResult.success;
    }
  }
}
