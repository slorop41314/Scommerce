import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static const route_name = "CartScreen";
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Cart screen"),
          ],
        ),
      ),
    );
  }
}