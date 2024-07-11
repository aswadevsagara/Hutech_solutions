import 'package:ec_app/application/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: ListView(
        padding:const EdgeInsets.all(16.0),
        children: [
          OrderItem(
            orderId: '#123456',
            status: 'Delivered',
            date: '21 Apr, 24',
            itemCount: 5,
          ),
          OrderItem(
            orderId: '#123456',
            status: 'In transit',
            date: '21 Apr, 24',
            itemCount: 5,
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String orderId;
  final String status;
  final String date;
  final int itemCount;

  OrderItem({
    required this.orderId,
    required this.status,
    required this.date,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order: $orderId'),
                      Icon(Icons.arrow_right_sharp,color: Colors.blue,)
                    ],
                  ),
                ),
               const Divider()
              ],
            ),
          ),
          ListTile(
            leading:const Icon(Icons.shopping_bag),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status == 'Delivered'
                      ? 'Delivered on $date'
                      : 'In transit on $date',
                  style: TextStyle(
                    color: status == 'Delivered' ? Colors.green : Colors.orange,
                  ),
                ),
                Text('+$itemCount items'),
              ],
            ),
            trailing: status == 'In transit'
                ? TextButton(
                    onPressed: () {
                      // Add your track order functionality here
                    },
                    child:const Text('Track Order'),
                  )
                :const Text(""),
          ),
        ],
      ),
    );
  }
}
