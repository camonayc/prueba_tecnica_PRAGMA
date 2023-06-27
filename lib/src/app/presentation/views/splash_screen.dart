import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_pragma/src/app/utils/constants/app_assets.dart';
import 'package:prueba_tecnica_pragma/src/app/utils/constants/app_strings.dart';

import '../../../core/domain/models/cat_model.dart';
import '../controllers/data_ctr.dart';

/// Interfaz inicial de la aplicacion que muestra el nombre de la misma, y da acceso a pantalla [LandingScreen] una vez se terminen de obtener los datos de los servicios.
class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final DataController controller = DataController.initializedController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.appTitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: size.height * 0.04),
            ),
            Image.asset(
              AppAssets.splashImage,
              scale: 0.8,
            ),
            FutureBuilder(
              future: controller.getCaData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    color: Colors.black,
                  );
                } else {
                  dataLoaded(
                      listCat: controller.catList,
                      imageList: controller.imageList,
                      context: context);
                  return Text(AppStrings.welcome,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.height * 0.02));
                }
              },
            ),
            Obx(() => controller.isLoading < 100
                ? Text("${controller.isLoading * 10}% / 100%")
                : Container())
          ],
        ),
      ),
    );
  }
}

void dataLoaded(
    {required List<CatModel> listCat,
    required List<File> imageList,
    required BuildContext context}) {
  Timer(const Duration(milliseconds: 50), () {
    Get.offAllNamed(AppStrings.landing, arguments: [listCat, imageList]);
  });
}
