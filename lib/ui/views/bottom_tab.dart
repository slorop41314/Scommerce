import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/views/cart_screen.dart';
import 'package:flutter_ecommerce/ui/views/home/home_screen.dart';
import 'package:flutter_ecommerce/ui/views/notification_screen.dart';
import 'package:flutter_ecommerce/ui/views/profile_screen.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class BottomNavBar extends StatefulWidget {
  static const route_name = "BottomNavBar";
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final List<Widget> screenData = [
    HomeScreen(),
    CartScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: _page == 0 ? kColorPrimary : Colors.grey,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: _page == 1 ? kColorPrimary : Colors.grey,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: _page == 2 ? kColorPrimary : Colors.grey,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: _page == 3 ? kColorPrimary : Colors.grey,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: kColorPrimary,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: IndexedStack(
        index: _page,
        children: screenData,
      ),
    );
  }
}
