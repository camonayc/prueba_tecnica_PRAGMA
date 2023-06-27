import 'package:flutter/material.dart';

import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_strings.dart';
import '../controllers/data_ctr.dart';

/// Widget que construye la barra de busqueda de la pantalla [LandingScreen] y permite buscar en la lista el valor que coincida.
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.size,
    required this.searButton,
    required this.searchController,
    required this.controller,
  });

  final Size size;
  final FocusNode searButton;
  final TextEditingController searchController;
  final DataController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppAssets.primaryColor, width: 0.6)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              focusNode: searButton,
              minLines: 1,
              maxLines: 1,
              controller: searchController,
              decoration: InputDecoration(
                hintText: AppStrings.searchButton,
                hintStyle: TextStyle(fontSize: size.height * 0.02),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03, vertical: size.height * 0.0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onFieldSubmitted: (value) {
                if (value != "") {
                  controller.searchCat(name: value);
                  searchController.clear();
                }
              },
            ),
          ),
          IconButton(
              onPressed: () {
                if (searchController.text != "") {
                  controller.searchCat(name: searchController.text);
                  searchController.clear();
                }
              },
              icon: Icon(
                Icons.search,
                size: size.height * 0.04,
              ))
        ],
      ),
    );
  }
}
