import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const route_name = "SearchScreen";
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: SafeArea(
        child: Container(
          child: Text("Search screen"),
        ),
      ),
    );
  }
}
