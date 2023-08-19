import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:synapsis_intern/data/models/crud_page/crud_model.dart';
import 'package:synapsis_intern/presentation/routes/route.dart';
import 'package:synapsis_intern/presentation/screens/auth/login/username_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('auth');
  Hive.registerAdapter(CRUDModAdapter());
  await Hive.openBox<List>('crud');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LoginUserPass(),
      getPages: Routes.pages,
    );
  }
}
