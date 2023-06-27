import 'package:flutter/material.dart';

/// Clase donde se contienen los [assets] y atributos constantes de la aplicación.
class AppAssets {
  static AppAssets? _singleton;
  factory AppAssets() => _singleton ??= AppAssets._();

  AppAssets._();
  static const String splashImage = "assets/images/splash_screen_cat.png";
  static const String defaulCatImage = "assets/images/gato_anonimo.png";

  static const Color primaryColor = Colors.black;
  static const Color secundaryColor = Colors.white;
  static const Color detailsButtonColor = Colors.blueAccent;
}
