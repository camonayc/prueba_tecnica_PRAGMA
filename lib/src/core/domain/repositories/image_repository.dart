import 'dart:io';

/// Repositorio que define la funciones que se usaran para la obtencion de datos.
abstract class ImageRepository {
  Future<File> getImageData({required String breedId});
}
