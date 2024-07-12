import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/const value/const_image_url.dart';
import '../../../core/constants/colors.dart';

class BottomProductView extends StatelessWidget {
  const BottomProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: url.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: Container(
                      height: 150,
                      width: 180,
                      margin: const EdgeInsets.only(left: 20),
                      color: Colors.green.withOpacity(.4),
                      child: Container(
                          margin: const EdgeInsets.all(25),
                          child: CachedNetworkImage(
                            imageUrl: url[index],
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  SizedBox(
                      width: 100,
                      child: Expanded(
                        child: Text(
                          homesPgDesc1[index],
                          maxLines: 2,
                        ),
                      ))
                ],
              ),
              Positioned(
                top: 5,
                left: 19,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Container(
                    height: 15,
                    width: 80,
                    color: Colors.green.withOpacity(.4),
                    child: const FittedBox(child: Text("data")),
                  ),
                ),
              ),
              Positioned(
                bottom: 55,
                right: 20,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  child: Container(
                    color: const Color.fromARGB(255, 7, 128, 11),
                    width: 20,
                    height: 20,
                    child: const Center(
                        child: Icon(
                      Icons.arrow_right,
                      color: white,
                    )),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
