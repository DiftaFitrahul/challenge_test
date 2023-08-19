import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synapsis_intern/data/models/auth/login/user_pass_model.dart';
import 'package:synapsis_intern/presentation/constants/auth/login/user_pass_login_const.dart';

class UserPassLoginService {
  const UserPassLoginService._();
  static UserPassLoginResult login(
      {required UserPassModel data, required Box<String> box}) {
    final loginValue = box.get(data.username);

    if (loginValue == null || loginValue.isEmpty) {
      return UserPassLoginResult.usernameNotExisted;
    } else {
      final dataLogin = UserPassModel.fromJson(jsonDecode(loginValue));
      if (dataLogin.password != data.password) {
        return UserPassLoginResult.passwordWrong;
      } else {
        return UserPassLoginResult.success;
      }
    }
  }
}
