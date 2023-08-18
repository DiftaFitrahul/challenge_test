import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:synapsis_intern/getx/auth/login/user_pass_login_controller.dart';
import 'package:synapsis_intern/getx/auth/regist/user_pass_regist_controller.dart';
import 'package:synapsis_intern/presentation/constants/auth/login/user_pass_login_const.dart';
import 'package:synapsis_intern/presentation/constants/auth/regist/user_pass_regist_const.dart';
import 'package:synapsis_intern/presentation/routes/route_name.dart';
import 'package:synapsis_intern/presentation/screens/home/home_page.dart';

class LoginUserPass extends StatelessWidget {
  const LoginUserPass({super.key});

  @override
  Widget build(BuildContext context) {
    final userPassAuthLogin = Get.put(UserPassLoginState());
    final userPassAuthRegist = Get.put(UserPassRegistState());
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
            return null;
          }
        });
      },
      onSubmitAnimationCompleted: () {
        Get.toNamed(RoutesName.firstPage);
      },
      onRecoverPassword: (p0) {},
    );
  }
}
