import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  static const route_name = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              AuthService.shared.logoutUser();
              Navigator.of(context).pushReplacementNamed("/");
            },
            child: Text("Logout"),
          )
        ],
      )),
    );
  }
}
