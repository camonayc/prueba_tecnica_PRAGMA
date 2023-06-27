import 'package:flutter/material.dart';

import '../../utils/constants/app_assets.dart';

/// Widget que construye el texto para el widget [InfoDetails] usado en la pantalla de [DetailScreen].
class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
    required this.size,
    required this.title,
  });

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.01),
      child: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: AppAssets.primaryColor,
            fontSize: size.height * 0.021,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
