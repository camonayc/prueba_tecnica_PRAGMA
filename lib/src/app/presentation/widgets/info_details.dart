import 'package:flutter/material.dart';

import '../../../core/domain/models/cat_model.dart';
import 'text_container.dart';

/// Widget que construye la información de la pantalla de detalles.
class InfoDetails extends StatelessWidget {
  const InfoDetails({
    super.key,
    required this.size,
    required this.cat,
  });

  final Size size;
  final CatModel cat;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.29,
      margin: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01, horizontal: size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextContainer(size: size, title: "${cat.description}"),
            TextContainer(size: size, title: "Origin: ${cat.origin}"),
            TextContainer(
                size: size, title: "Intelligence: ${cat.intelligence}"),
            TextContainer(
                size: size, title: "Adaptability: ${cat.adaptability}"),
            TextContainer(
                size: size, title: "Life span: ${cat.lifeSpan} years"),
          ],
        ),
      ),
    );
  }
}
