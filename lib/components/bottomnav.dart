import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:mart/pages/home.dart';

import 'package:mart/pages/login.dart';

class BottomNavBar extends StatelessWidget {
  final int currentPage;

  const BottomNavBar({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.red,
      backgroundColor: Colors.white,
      index: currentPage,
      items: <Widget>[
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.shopping_cart, size: 30, color: Colors.white),
        Icon(Icons.category_sharp, size: 30, color: Colors.white),
        Icon(Icons.library_add, size: 30, color: Colors.white),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Mart Home')),
              (route) => false,
            );
            break;

          case 3:
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false,
            );
            break;
          default:
            break;
        }
      },
    );
  }
}
