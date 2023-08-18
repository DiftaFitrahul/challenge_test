import 'package:get/get.dart';
import 'package:synapsis_intern/presentation/routes/route_name.dart';
import 'package:synapsis_intern/presentation/screens/home/home_page.dart';

class Routes {
  const Routes._();

  static final pages = [
    GetPage(
      name: RoutesName.firstPage,
      page: () => const FirstPage(),
    )
  ];
}
