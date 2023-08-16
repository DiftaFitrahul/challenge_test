import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:synapsis_intern/data/models/auth/login/user_pass_model.dart';
import 'package:synapsis_intern/data/service/auth/login/user_pass_login.dart';
import 'package:synapsis_intern/presentation/constants/auth/login/user_pass_login_const.dart';

class UserPassLoginState extends GetxController {
  late Box<String> dataBox;

  @override
  void onInit() {
    dataBox = Hive.box('auth');
    super.onInit();
  }

  UserPassLoginResult login(
      {required String username, required String password}) {
    UserPassModel model = UserPassModel(username: username, password: password);
    final result = UserPassLoginService.login(data: model, box: dataBox);
    return result;
  }
}
