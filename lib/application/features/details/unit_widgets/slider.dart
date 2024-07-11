import 'package:carousel_slider/carousel_slider.dart';
import 'package:ec_app/application/features/details/ui/products_screen.dart';
import 'package:flutter/material.dart';

class CaurosalSliderr extends StatelessWidget {
  const CaurosalSliderr({
    super.key,
    required this.widget,
  });

  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.homeScreenModel.image.length,
        itemBuilder: (context, index, realIndex) {
          return Card(
              child: SizedBox(
                  height: 200,
                  child: Image.network(
                    widget.homeScreenModel.image,
                    fit: BoxFit.fill,
                  )));
        },
        options: CarouselOptions());
  }
}
