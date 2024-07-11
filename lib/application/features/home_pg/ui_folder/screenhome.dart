import 'dart:math';

import 'package:ec_app/application/core/constants/colors.dart';
import 'package:ec_app/application/core/const%20value/const_image_url.dart';
import 'package:ec_app/application/features/details/ui/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/homescn_provider.dart';
import '../widget/bannerslider.dart';
import '../widget/modals/home_scrnmodel.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final random = Random();

  final List<HomeScreenModel> homescndata = List.generate(homesPgDesc1.length,
      (index) => HomeScreenModel("${homesPgDesc1[index]}", "${url[index]}"));

  @override
  Widget build(BuildContext context) {
    final imageProviderr = Provider.of<HomeScreenPvdr>(context);
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///******** caurosal slider **************///

            imageProviderr.imageUrls.isEmpty
                ? const CircularProgressIndicator()
                : BannerSlider(imageProviderr: imageProviderr),

            ///******** Product information text **************///

            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 23),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Information",
                      style: GoogleFonts.roboto(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "List of drugs assigned to you",
                      style: GoogleFonts.roboto(
                          fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),

            /********* Product view ************/
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homescndata.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        homeScreenModel: homescndata[index],
                      ),
                    ));
                  },
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
                              color:
                                  Colors.primaries[next(0, 17)].withOpacity(.12),
                              child: Container(
                                  margin: const EdgeInsets.all(25),
                                  child: Image.network(
                                    homescndata[index].image,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          SizedBox(
                              width: 100,
                              child: Expanded(
                                child: Text(
                                  homescndata[index].des1,
                                  maxLines: 2,
                                ),
                              ))
                        ],
                      ),
                      Positioned(
                        top: 5,
                        left: 13,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: Container(
                            height: 15,
                            width: 80,
                            color:
                                Colors.primaries[next(0, 17)].withOpacity(.4),
                            child: const FittedBox(child: Text("data")),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 55,
                        right: 20,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
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
            )
          ],
        ),
      ),
    );
  }

  ///************** For making Random colors for grid view ***************///
  int next(int min, int max) => min + random.nextInt(max - min);
}
