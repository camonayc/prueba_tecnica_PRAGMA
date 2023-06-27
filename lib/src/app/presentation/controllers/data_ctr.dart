import 'dart:io';

import 'package:get/get.dart';
import 'package:prueba_tecnica_pragma/src/core/data/repositories/cat_data_repository.dart';
import 'package:prueba_tecnica_pragma/src/core/data/repositories/image_data_repository.dart';
import 'package:prueba_tecnica_pragma/src/core/domain/models/cat_model.dart';

/// Controlador para el flujo de los datos en la aplicacion, donde se almacenan reactivamente.
class DataController extends GetxController {
  /// Inicializacion del controlador donde si no hay una instancia del mismo le agrega y si ya existe una la utiliza.
  static DataController initializedController() {
    try {
      final DataController controller = Get.find<DataController>();
      return controller;
    } catch (e) {
      final DataController controller = Get.put(DataController());
      return controller;
    }
  }

  final CatDataRepository _catDataRepository = CatDataRepository();
  final ImageDataRepository _imageDataRepository = ImageDataRepository();

  RxInt isLoading = 0.obs;

  /// Lista dinamica para contener los [CatModel] obtenidos al consumir el servicio de [_getCatList].
  RxList<CatModel> catList = <CatModel>[].obs;

  /// Lista dinamica que almacena los [File] donde se encuentra en la foto del [CatModel].
  RxList<File> imageList = <File>[].obs;

  /// Liista dinamica para almacenar los [CatModel] y [File] encontrados al realizar la busqueda.
  RxList<dynamic> filter = <dynamic>[].obs;

  /// Función futura que no retorna nada, pero ejecuta asincronamente las funciones [_getCatList] y [_getCatImage].
  Future<void> getCaData() async {
    await _getCatList();
    await _getCatImage();
  }

  /// Función futura que no retorna nada, almacena en la variable [catList] la lista de [CatModel] usando el servicio [getCatList] de la clase [CatDataRepository].
  Future<void> _getCatList() async {
    catList.value = await _catDataRepository.getCatList();
  }

  /// Función futura que no retorna nada, almacena en la variable [imageList] la foto respectiva a cada [CatModel] en [catList] usando el servicio [getImageData] de la clase [ImageDataRepository].
  Future<void> _getCatImage() async {
    for (var i = 0; i < catList.length; i++) {
      imageList.add(
          await _imageDataRepository.getImageData(breedId: catList[i].id!));
      isLoading.value++;
    }
  }

  /// Función que no retorna nada, evalua si en la lista [catList] hay algun [CatModel] con el mismo [name], si es asi lo guarda en la lista [filter],
  /// luego evalua si en la lista [imageList] hay una [File] en el cuale el path tenga el id del mismo [CatModel] siendo el caso agrega el [File] a la lista [filter],
  /// si no se cumple agrega a la lista [filter] un [File] con el path vacio.
  void searchCat({required String name}) async {
    if (name != "") {
      final List<CatModel> cat = catList
          .where((e) => e.name!.toLowerCase() == name.toLowerCase())
          .toList();
      if (cat.isNotEmpty) {
        filter.add(cat);
        final List<File> image = imageList
            .where((e) =>
                e.path.toLowerCase() ==
                "/data/user/0/com.example.prueba_tecnica_pragma/cache/${cat.first.id}.jpg")
            .toList();
        if (image.isEmpty) {
          filter.add(File(""));
        } else {
          if (image.length > 1) {
            filter.add([image.first]);
          } else {
            filter.add([image]);
          }
        }
        return;
      } else {
        Get.defaultDialog(
            title: "Not Found", middleText: "No results were found for: $name");
        filter.clear();
        return;
      }
    }
  }

  /// Funcion que limpia la variable filter.
  void clearFilter() {
    filter.clear();
  }
}
