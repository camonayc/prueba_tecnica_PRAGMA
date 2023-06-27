import '../../domain/models/cat_model.dart';
import '../datasource/remote/cat_data_service.dart';

/// Repositorio para el consumo de los servicios de [CatDataRepository] desde el controlador.
class CatDataRepository {
  final CatDataService _service = CatDataService();

  Future<List<CatModel>> getCatList() async {
    try {
      return _service.getCatData();
    } catch (e) {
      return [];
    }
  }
}
