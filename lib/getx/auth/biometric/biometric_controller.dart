import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class BiometricController extends GetxController {
  late LocalAuthentication localAuthentication;
  RxBool isSupportedBiometricAuth = false.obs;
  RxList<BiometricType> biometricType = <BiometricType>[].obs;
  RxBool authenticateUserStatus = false.obs;

  @override
  void onInit() async {
    localAuthentication = LocalAuthentication();
    isSupportedBiometricAuth.value =
        await localAuthentication.isDeviceSupported();
    super.onInit();
  }

  void getAvailableBiometricAuthentication() async {
    biometricType.value = await localAuthentication.getAvailableBiometrics();
  }

  Future<void> authenticate() async {
    try {
      authenticateUserStatus.value = await localAuthentication.authenticate(
          localizedReason: 'Please Authenticated',
          options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ));
    } catch (err) {
      rethrow;
    }
  }
}
