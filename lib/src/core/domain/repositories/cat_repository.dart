import 'package:prueba_tecnica_pragma/src/core/domain/models/cat_model.dart';

/// Repositorio que define la funciones que se usaran para la obtencion de datos.
abstract class CatRepository {
  Future<List<CatModel>> getCatData();
}
