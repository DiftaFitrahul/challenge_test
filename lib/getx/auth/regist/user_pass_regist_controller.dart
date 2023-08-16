import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:synapsis_intern/data/models/auth/login/user_pass_model.dart';
import 'package:synapsis_intern/data/service/auth/regist/user_pass_signup.dart';
import 'package:synapsis_intern/presentation/constants/auth/regist/user_pass_regist_const.dart';

class UserPassRegistState extends GetxController {
  late Box<String> dataBox;

  @override
  void onInit() {
    dataBox = Hive.box('auth');
    super.onInit();
  }

  Future<UserPassRegistResult> regist(
      {required String username, required String password}) async {
    UserPassModel model = UserPassModel(username: username, password: password);
    final result =
        await UserPassRegistService.regist(data: model, box: dataBox);
    return result;
  }
}
