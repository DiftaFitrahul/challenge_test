import 'package:get/get.dart';
import 'package:synapsis_intern/presentation/bindings/first_page_binding.dart';
import 'package:synapsis_intern/presentation/bindings/second_page_binding.dart';
import 'package:synapsis_intern/presentation/routes/route_name.dart';
import 'package:synapsis_intern/presentation/screens/first_page/first_page.dart';
import 'package:synapsis_intern/presentation/screens/second_page/second_page.dart';

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
        binding: SecondPageBinding())
  ];
}
