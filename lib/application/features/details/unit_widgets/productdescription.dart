import 'package:flutter/material.dart';

import '../ui/products_screen.dart';

class ProductDescriptionPg extends StatelessWidget {
  const ProductDescriptionPg({
    super.key,
    required this.widget,
  });

  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 2.2 / 3,
          child: Text(
            widget.homeScreenModel.des1,
            overflow: TextOverflow.visible,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )),
    );
  }
}
