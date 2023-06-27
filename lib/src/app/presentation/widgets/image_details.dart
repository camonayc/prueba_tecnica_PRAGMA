import 'dart:io';

import 'package:flutter/material.dart';

import '../../utils/constants/app_assets.dart';

/// Widget que construye la imagen en la pantalla de detalles.
class ImageDetails extends StatelessWidget {
  const ImageDetails({
    super.key,
    required this.size,
    required this.image,
  });

  final Size size;
  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: size.height * 0.6,
        margin: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.height * 0.01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppAssets.primaryColor, width: 0.4)),
        child: image.path != ""
            ? Image.file(
                image,
                fit: BoxFit.cover,
              )
            : Image.asset(
                AppAssets.defaulCatImage,
                fit: BoxFit.fill,
              ));
  }
}
