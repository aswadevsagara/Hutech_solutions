import 'package:flutter/material.dart';

class ProductAndSaeftyInfo extends StatelessWidget {
  final List<String> detailslist;
  const ProductAndSaeftyInfo({
    super.key,
    required this.detailslist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: detailslist.map((strone) {
          return Row(children: [
            const Text(
              "\u2022",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                strone,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ]);
        }).toList(),
      ),
    );
  }
}
