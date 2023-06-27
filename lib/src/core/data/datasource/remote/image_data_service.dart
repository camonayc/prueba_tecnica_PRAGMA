import 'dart:io';

import 'package:dio/dio.dart';
import 'package:prueba_tecnica_pragma/src/core/domain/repositories/image_repository.dart';
import 'package:http/http.dart' as http;

import '../../../../app/utils/constants/app_services.dart';
import 'package:path_provider/path_provider.dart';

/// Clase donde se implemtenta el repositorio [ImageRepository] y se sobre escribe la funcion [getImageData] para la obtencion de las imagenes.
class ImageDataService implements ImageRepository {
  /// Funcion que ejecuta la peción [get] a la API en [AppServices] introduciendo el id de la raza [breedId]  para obtener la imagen y guardarla en cache como un [File].
  ///
  /// Retorna un [File].
  ///
  /// En caso de error se retorna un [File] con el path como [String] vacio.
  @override
  Future<File> getImageData({required String breedId}) async {
    try {
      var tempDir = await getTemporaryDirectory();
      String fullPath = "${tempDir.path}/$breedId.jpg";
      final response = await Dio().get("${AppServices.getImageDataURL}$breedId",
          queryParameters: AppServices.xApiKey);

      if (response.statusCode == 200) {
        final image = response.data;
        http.Client client = http.Client();
        var req = await client.get(Uri.parse(image[0]['url']));
        var bytes = req.bodyBytes;
        File file = File(fullPath);
        await file.writeAsBytes(bytes);
        return file;
      } else {
        return File("");
      }
    } catch (e) {
      return File("");
    }
  }
}
