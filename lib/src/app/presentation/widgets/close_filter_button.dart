import 'package:flutter/material.dart';

import '../../utils/constants/app_assets.dart';

class CloseFilterButton extends StatelessWidget {
  const CloseFilterButton({
    super.key,
    required this.size,
    this.onPressed,
  });

  final Size size;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        style: const ButtonStyle(
            iconColor: MaterialStatePropertyAll(AppAssets.secundaryColor),
            backgroundColor: MaterialStatePropertyAll(AppAssets.primaryColor),
            shape: MaterialStatePropertyAll(CircleBorder(
                side: BorderSide(width: 2, color: AppAssets.primaryColor)))),
        icon: const Icon(Icons.clear),
        iconSize: size.height * 0.04);
  }
}
