import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_pragma/src/app/presentation/controllers/data_ctr.dart';
import 'package:prueba_tecnica_pragma/src/app/utils/constants/app_strings.dart';

import '../widgets/close_filter_button.dart';
import '../widgets/list_cards.dart';
import '../widgets/search_bar.dart';

/// Interfaz que muestra la lista de [ModelCat] con su respectiva imagen, y permite realizar una busqueda entre ellas.
class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);

  final DataController controller = DataController.initializedController();

  final FocusNode searButton = FocusNode();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<dynamic> catList =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.appTitle,
          style: TextStyle(
              fontSize: size.height * 0.03, fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => controller.filter.isNotEmpty
          ? CloseFilterButton(
              size: size,
              onPressed: () => controller.clearFilter(),
            )
          : Container()),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: size.height,
          margin: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
          ),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                CustomSearchBar(
                    size: size,
                    searButton: searButton,
                    searchController: searchController,
                    controller: controller),
                Obx(() => controller.filter.isEmpty
                    ? ListCards(size: size, catList: catList)
                    : ListCards(size: size, catList: controller.filter)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
