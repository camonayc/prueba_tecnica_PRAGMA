import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/domain/models/cat_model.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_strings.dart';

/// Widget que construye la tarjeta que almacena la foto y tres datos del [CatModel], siendo el nombre de la raza, pais de origen e inteligencia,
/// permitiendo acceder a la pantalla de [DetailScreen] mediante un [TextButton].
class CatCard extends StatelessWidget {
  const CatCard({
    super.key,
    required this.size,
    required this.cat,
    required this.image,
  });

  final Size size;
  final CatModel cat;
  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: size.height * 0.01, bottom: size.height * 0.02),
      width: size.width,
      padding: EdgeInsets.only(
          left: size.width * 0.035,
          right: size.width * 0.035,
          bottom: size.height * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppAssets.primaryColor, width: 0.6)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: size.width * 0.02),
                child: Text(
                  "${cat.name}",
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
              ),
              TextButton(
                  onPressed: () =>
                      Get.toNamed(AppStrings.details, arguments: [cat, image]),
                  child: Text(
                    AppStrings.detailsButton,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: size.height * 0.025,
                        color: AppAssets.detailsButtonColor),
                  ))
            ],
          ),
          Container(
            width: size.width * 0.8,
            height: size.height * 0.4,
            margin: EdgeInsets.only(bottom: size.height * 0.01),
            decoration: BoxDecoration(
                border: Border.all(color: AppAssets.primaryColor, width: 0.2)),
            child: image.path != ""
                ? Image.file(
                    image,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    AppAssets.defaulCatImage,
                    fit: BoxFit.cover,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: size.width * 0.02),
                child: Text(
                  "${cat.origin}",
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: size.width * 0.01),
                child: Text(
                  "${cat.intelligence}",
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
