import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_pragma/src/core/domain/models/cat_model.dart';

import '../widgets/image_details.dart';
import '../widgets/info_details.dart';

/// Interfaz para mostrar los detalles de cada [CatModel].
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<dynamic> catData =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    final CatModel cat = catData[0];
    final File image = catData[1];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${cat.name}",
            style: TextStyle(
                fontSize: size.height * 0.03, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: size.height * 0.03,
              )),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageDetails(size: size, image: image),
                InfoDetails(size: size, cat: cat)
              ],
            ),
          ),
        ));
  }
}
