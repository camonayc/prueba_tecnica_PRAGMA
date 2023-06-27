import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_pragma/src/app/config/router/routes.dart';

import 'src/app/utils/constants/app_strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Prueba tecnica Pragma',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Rubik-Italic'),
      initialRoute: AppStrings.splash,
      routes: Routes.routes,
    );
  }
}
