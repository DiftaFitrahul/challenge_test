import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/getx/auth/login/user_pass_login_controller.dart';
import 'package:synapsis_intern/getx/auth/regist/user_pass_regist_controller.dart';
import 'package:synapsis_intern/getx/auth/username/username_controller.dart';
import 'package:synapsis_intern/getx/firts_page/first_page_controller.dart';
import 'package:synapsis_intern/presentation/constants/auth/login/user_pass_login_const.dart';
import 'package:synapsis_intern/presentation/constants/auth/regist/user_pass_regist_const.dart';
import 'package:synapsis_intern/presentation/routes/route_name.dart';

class LoginUserPass extends StatelessWidget {
  const LoginUserPass({super.key});

  @override
  Widget build(BuildContext context) {
    final firstPageController = Get.put(FirstPageController());
    final userPassAuthLogin = Get.put(UserPassLoginState());
    final userPassAuthRegist = Get.put(UserPassRegistState());
    final usernameController = Get.put(UserNameController());
    return FlutterLogin(
      title: 'Username',
      userType: LoginUserType.name,
      userValidator: (value) {
        if (value == null || value.length < 3) {
          return 'Panjang Username minimal 3';
        }
        return null;
      },
      passwordValidator: (value) {
        if (value == null || value.length < 6) {
          return 'Panjang password minimal 6';
        }
        return null;
      },
      onSignup: (data) async {
        return await Future.delayed(const Duration(seconds: 1)).then((_) async {
          final result = await userPassAuthRegist.regist(
              username: data.name ?? '', password: data.password ?? '');
          if (result == UserPassRegistResult.usernameExisted) {
            return 'Username exist';
          } else {
            usernameController.username.value = data.name ?? '';
            return null;
          }
        });
      },
      onLogin: (data) {
        return Future.delayed(const Duration(seconds: 1)).then((_) {
          final result = userPassAuthLogin.login(
              username: data.name, password: data.password);
          if (result == UserPassLoginResult.usernameNotExisted) {
            return 'Username not exists';
          } else if (result == UserPassLoginResult.passwordWrong) {
            return 'Password wrong';
          } else {
            usernameController.username.value = data.name;
            return null;
          }
        });
      },
      onSubmitAnimationCompleted: () async {
        firstPageController.getDataInfoBattery();
        firstPageController.getGyroscope();
        firstPageController.getAccelerometer();
        firstPageController.getMagnetometer();
        Get.toNamed(RoutesName.firstPage);
      },
      onRecoverPassword: (p0) {},
    );
  }
}
