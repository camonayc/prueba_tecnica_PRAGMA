import 'package:flutter/material.dart';

import 'cat_card.dart';

/// Widget que construye en contenedor de la lista de [CatCard] por cada [CatModel].
class ListCards extends StatelessWidget {
  const ListCards({
    super.key,
    required this.size,
    required this.catList,
  });

  final Size size;
  final List catList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.84,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: catList[0].length,
              itemBuilder: (context, index) => CatCard(
                  size: size, cat: catList[0][index], image: catList[1][index]),
            ),
          ],
        ),
      ),
    );
  }
}
