import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'OpenSans',
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1,
    ),
    primaryColor: kColorPrimary,
    accentColor: kColorPrimary,
    hintColor: Color(0xffcdd3e0),
    dividerColor: Colors.grey[100],
    buttonColor: kColorPrimary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      caption: TextStyle(
        fontSize: 12,
      ),
      headline1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[100],
      thickness: 1,
    ),
  );
}
