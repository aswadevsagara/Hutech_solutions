import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../provider/homescn_provider.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.imageProviderr,
  });

  final HomeScreenPvdr imageProviderr;

  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
        autoPlay: true,
        height: 210,
        itemCount: 3,
        aspectRatio: 16 / 9,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 18, left: 8, bottom: 18),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(imageUrl:  imageProviderr.imageUrls[index],
                    fit: BoxFit.fill)),
          );
        });
  }
}
