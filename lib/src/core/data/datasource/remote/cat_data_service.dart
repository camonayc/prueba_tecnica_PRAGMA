import 'dart:developer';

import 'package:prueba_tecnica_pragma/src/app/utils/constants/app_services.dart';
import 'package:prueba_tecnica_pragma/src/core/domain/models/cat_model.dart';
import 'package:prueba_tecnica_pragma/src/core/domain/repositories/cat_repository.dart';
import 'package:dio/dio.dart';

/// Clase donde se implemtenta el repositorio [CatRepository] y se sobre escribe la funcion [getCarData] para la obtencion de los datos.
class CatDataService implements CatRepository {
  final Dio _dio = Dio();

  /// Funcion que ejecuta la peción [get] a la API en [AppServices] para obtener la lista de [CatModel].
  /// 
  /// Retorna un [List<CatModel>].
  /// 
  /// En caso de error se retorna una lista vacia.
  @override
  Future<List<CatModel>> getCatData() async {
    try {
      final Response response = await _dio.get(AppServices.getCatDataURL,
          queryParameters: AppServices.xApiKey);
      if (response.statusCode == 200) {
        final List<CatModel> data =
            List<CatModel>.from(response.data.map((x) => CatModel.fromMap(x)));
        return data;
      } else {
        return [];
      }
    } catch (e) {
      log("Error CatDataService => getCatData: $e");
      return [];
    }
  }
}
