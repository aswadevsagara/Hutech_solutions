import 'package:flutter/material.dart';

class FreeSampleTrial extends StatelessWidget {
  const FreeSampleTrial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
          text: const TextSpan(children: [
        TextSpan(
            text: "FREE\t",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        TextSpan(
            text: "Sample",
            style: TextStyle(fontSize: 14, color: Colors.black)),
        TextSpan(
            text: "  TRAIL",
            style: TextStyle(
                fontSize: 12,
                backgroundColor: Color.fromARGB(255, 202, 233, 248),
                color: Colors.blue,
                fontWeight: FontWeight.w500))
      ])),
    );
  }
}
