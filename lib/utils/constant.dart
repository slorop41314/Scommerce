import 'package:flutter/material.dart';

class K {
  static CustomSizes size = CustomSizes();
}

class DBCollection {
  static String userCollection = "users";
  static String productCollection = "products";
}

Color kColorPrimary = Colors.lightBlue;

class CustomSizes {
  final bodyPadding = EdgeInsets.all(20);
  final bodyHorizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  final contentPadding = EdgeInsets.all(10);
  final contentBottomPadding = EdgeInsets.only(bottom: 5);
  final cardProductPadding = EdgeInsets.all(5);
  double contentGap = 10;
  double groupMargin = 20;
  double wideGroupGap = 40;
}
