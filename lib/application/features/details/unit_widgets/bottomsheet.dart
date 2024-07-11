import 'package:ec_app/application/features/details/provider/deatiles_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../success_page/ui/success_page.dart';

class ProductPageBottomSheet extends StatelessWidget {
  const ProductPageBottomSheet({
    super.key,
    required this.provider,
  });

  final DeatilesProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Consumer<DeatilesProvider>(builder: (context, state, _) {
              return Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: state.product_count == 12
                        ? const Color.fromARGB(255, 218, 110, 103)
                        : Colors.grey[300]!,
                    width: 3,
                  ), // Add border here
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Provider.of<DeatilesProvider>(context).incriment();
                        provider.decriment();
                      },
                      child: const Text(
                        "-",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ), // Add spacing between texts
                    Consumer<DeatilesProvider>(builder: (context, state, _) {
                      return Text(state.product_count.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold));
                    }),
                    const SizedBox(width: 5), // Add spacing between texts
                    GestureDetector(
                      onTap: () {
                        // Provider.of<DeatilesProvider>(context).decriment();
                        provider.incriment();
                      },
                      child: const Text("+",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              );
            }),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 60,
            color: const Color.fromARGB(255, 42, 182, 173),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<DeatilesProvider>(
                  builder: (context,obj, _) {
                    return GestureDetector(
                      onTap: () {
                        if(obj.product_count!=12){
                           Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SuccessScreen(),
                        ));
                        }
                      },
                      child: const Text(
                        "Place Order",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
