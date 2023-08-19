import 'package:get/get.dart';
import 'package:synapsis_intern/presentation/bindings/auth_local_binding.dart';
import 'package:synapsis_intern/presentation/bindings/crud_page_binding.dart';
import 'package:synapsis_intern/presentation/bindings/first_page_binding.dart';
import 'package:synapsis_intern/presentation/bindings/qr_scanner_binding.dart';
import 'package:synapsis_intern/presentation/bindings/second_page_binding.dart';
import 'package:synapsis_intern/presentation/bindings/third_page_binding.dart';
import 'package:synapsis_intern/presentation/routes/route_name.dart';
import 'package:synapsis_intern/presentation/screens/auth/auth_local/qr_scanner.dart';
import 'package:synapsis_intern/presentation/screens/crud_page/crud_page.dart';
import 'package:synapsis_intern/presentation/screens/first_page/first_page.dart';
import 'package:synapsis_intern/presentation/screens/auth/auth_local/auth_bio_page.dart';
import 'package:synapsis_intern/presentation/screens/second_page/second_page.dart';
import 'package:synapsis_intern/presentation/screens/third_page/third_page.dart';

class Routes {
  const Routes._();

  static final pages = [
    GetPage(
        name: RoutesName.firstPage,
        page: () => const FirstPage(),
        binding: FirstPageBindings()),
    GetPage(
        name: RoutesName.secondPage,
        page: () => const SecondPage(),
        binding: SecondPageBinding()),
    GetPage(
        name: RoutesName.crudPage,
        page: () => const CrudPage(),
        binding: CrudPageBinding()),
    GetPage(
      name: RoutesName.thirdPage,
      page: () => const ThirdPage(),
      binding: ThirdPageBinding(),
    ),
    GetPage(
        name: RoutesName.authBioPage,
        page: () => const AuthBiometricAndQRcode(),
        binding: AuthLocalBinding()),
    GetPage(
        name: RoutesName.qrScannerPage,
        page: () => const QrScannerPage(),
        binding: QRScannerBinding()),
  ];
}
