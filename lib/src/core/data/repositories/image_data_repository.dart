import 'dart:io';

import 'package:prueba_tecnica_pragma/src/core/data/datasource/remote/image_data_service.dart';

/// Repositorio para el consumo de los servicios de [ImageDataRepository] desde el controlador.
class ImageDataRepository {
  final ImageDataService _service = ImageDataService();

  Future<File> getImageData({required String breedId}) async {
    try {
      return _service.getImageData(breedId: breedId);
    } catch (e) {
      return File("");
    }
  }
}
