import 'package:ec_app/application/core/constants/colors.dart';
import 'package:ec_app/application/features/home_pg/ui_folder/screenhome.dart';
import 'package:ec_app/application/features/my_orders_pg/ui_folder/my_orderscn.dart';
import 'package:ec_app/application/features/cart_screen/ui_folder/cart.dart';
import 'package:flutter/material.dart';

import '../../features/profile_pg/ui_folder/profile_pg.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    ScreenHome(),
   MyOrderScreen(),
    ScreenCart(),
    ProfileScreen()

  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        backgroundColor: white,
        selectedItemColor: gradientAppBarColordown,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        
        
        onTap: onTabTapped,
      ),
    );
  }
}
