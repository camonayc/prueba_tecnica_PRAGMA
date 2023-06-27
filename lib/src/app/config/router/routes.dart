import 'package:flutter/material.dart';
import 'package:prueba_tecnica_pragma/src/app/presentation/views/detail_screen.dart';
import 'package:prueba_tecnica_pragma/src/app/presentation/views/landing_screen.dart';
import 'package:prueba_tecnica_pragma/src/app/presentation/views/splash_screen.dart';

import '../../utils/constants/app_strings.dart';

/// Clase para el manejo de las rutas.
class Routes {
  /// Mapa que retorna la interfaz segun el nombre asignado.
  static Map<String, Widget Function(BuildContext)> routes = {
    AppStrings.splash: (_) => SplashScreen(),
    AppStrings.landing: (_) => LandingScreen(),
    AppStrings.details: (_) => const DetailScreen()
  };
}
