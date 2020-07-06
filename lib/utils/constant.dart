import 'package:flutter/material.dart';

class K {
  static CustomColors colors = CustomColors();
  static CustomSizes size = CustomSizes();
}

class DBCollection {
  static String userCollection = "users";
}

class CustomColors {
  Color primary = Colors.lightBlue;
}

class CustomSizes {
  final bodyPadding = EdgeInsets.all(20);
  final contentPadding = EdgeInsets.all(10);
  final cardProductPadding = EdgeInsets.all(5);
  double contentGap = 10;
  double groupMargin = 20;
  double wideGroupGap = 40;
}
