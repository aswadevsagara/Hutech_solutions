import 'package:ec_app/application/features/details/provider/deatiles_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/const value/product_scrnstrings.dart';
import '../../../core/constants/colors.dart';
import '../../home_pg/widget/modals/home_scrnmodel.dart';
import '../unit_widgets/bottom_productview.dart';
import '../unit_widgets/bottomsheet.dart';
import '../unit_widgets/freesample_trail.dart';
import '../unit_widgets/pdt_safety_desc.dart';
import '../unit_widgets/productdescription.dart';
import '../unit_widgets/slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final HomeScreenModel homeScreenModel;
  const ProductDetailsScreen({super.key, required this.homeScreenModel});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    const gradientAppBarColorup = Color.fromARGB(255, 133, 212, 205);
    const gradientAppBarColordown = Color.fromARGB(255, 24, 152, 142);

    final provider = Provider.of<DeatilesProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 50,
          title: const Text(
            "Dr. Rachel Green",
          ),
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    //  margin: EdgeInsets.all(12),
                    height: 380,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /********Caurosal slider**************/

                        CaurosalSliderr(widget: widget),

                        /********Product description **************/

                        ProductDescriptionPg(widget: widget),

                        /********free sample trial description **************/

                        const FreeSampleTrial(),
                        Container(
                          color: const Color.fromARGB(255, 145, 231, 223),
                          height: 40,
                          width: MediaQuery.sizeOf(context).width,
                          child: const Center(
                            child: Text(
                              "Maximum of 12 unit can be added in the cart.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color:Color.fromARGB(255, 113, 100, 100) ,
                            ),
                          ),
                        ),
                        )
                      ],
                    
                    ),
                  ),
                  Container(
                    height: 10,
                    color: litegrey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Container(
                      margin: EdgeInsets.only(left: 18),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          const Text(
                        "Product Information",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15, top: 5),
                        child: Text(
                            style: TextStyle(fontSize: 16),
                            overflow: TextOverflow.clip,
                            maxLines: 5,
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. "),
                      ),
                      const Text(
                        "Uses: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "It is used for measurising the blood pressure of individuals",
                        maxLines: isExpanded ? null : 1,
                        overflow: isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      isExpanded
                          ? const Text(
                              "Product Features And Specifications: ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          : const Text(""),
                      isExpanded
                          ? ProductAndSaeftyInfo(
                              detailslist: featuresList,
                            )
                          : const Text(""),
                      const SizedBox(
                        height: 10,
                      ),
                      isExpanded
                          ? const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Direction For Use: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Use as directed on the label",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Safety Information:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : const Text(""),
                      isExpanded
                          ? ProductAndSaeftyInfo(
                              detailslist: safetyList,
                            )
                          : const Text(""),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              isExpanded ? "view less" : 'view more',
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      ],
                     ),),
                   SizedBox(height: 30,),
                  
                     Container(
                      color:litegrey ,
                      height:400,
                       child: Expanded(
                         child: Column(children: [
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
                                            const   SizedBox(
                          height: 200,
                          ///*******   Bottom Poduct view  ****************///
                          ///
                          child: BottomProductView(),
                                               ),
                         ],),
                       ),
                     ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Consumer<DeatilesProvider>(
              builder: (context, value, child) => Visibility(
                visible: value.product_count == 12,
                child: Container(
                  decoration: BoxDecoration(
                    color: white.withOpacity(.7),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.red, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                  height: 40,
                  width: double.infinity,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.grey,
                      ),
                      Text("You have reached maximum limit!")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomSheet: ProductPageBottomSheet(provider: provider));
  }
}

