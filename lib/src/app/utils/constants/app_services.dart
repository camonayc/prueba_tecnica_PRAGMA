/// Clase donde se contienen las API de los servicios.
class AppServices {
  static AppServices? _singleton;
  factory AppServices() => _singleton ??= AppServices._();

  AppServices._();

  static String getCatDataURL = "https://api.thecatapi.com/v1/breeds?limit=10";
  static String getImageDataURL =
      "https://api.thecatapi.com/v1/images/search?limit=1&breed_ids=";
  static Map<String, String> xApiKey = {
    "x-api-key": " bda53789-d59e-46cd-9bc4-2936630fde39"
  };
}
