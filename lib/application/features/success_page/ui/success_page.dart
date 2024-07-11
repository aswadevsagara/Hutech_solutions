import 'package:ec_app/application/features/success_page/provider/success_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SuccesssProvider>(context).navigationPop(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 120,
              child: Image.network(
                "https://i.pngimg.me/thumb/f/720/m2H7i8N4K9H7d3A0.jpg",
                fit: BoxFit.fill,
                
              ),
            ),
            Text(
              "Payment completed",
              
            )
          ],
        ),
      ),
    );
  }
}
