import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors.dart';

class ScreenCart extends StatefulWidget {
  const ScreenCart({super.key});

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 50,
        title: Text("PharmaConnect",
            style: GoogleFonts.lato(textStyle: const TextStyle(color: white))),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [gradientAppBarColorup, gradientAppBarColordown],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Badge(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.trolley),
            Text(
              "Cart",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
