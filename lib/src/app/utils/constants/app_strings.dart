/// Clase donde se contienen las constantes de tipo [String] de la aplicación.
class AppStrings {
  static AppStrings? _singleton;
  factory AppStrings() => _singleton ??= AppStrings._();

  AppStrings._();

  static const String splash = "/splash";
  static const String landing = "/landing";
  static const String details = "/details";

  static const String appTitle = "CatBreeds";
  static const String welcome = "Welcome";
  static const String searchButton = "Search...";
  static const String detailsButton = "details..";
}
