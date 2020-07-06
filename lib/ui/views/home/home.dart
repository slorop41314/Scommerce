import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/service/auth_service.dart';
import 'package:flutter_ecommerce/core/service/user_service.dart';

class HomeScreen extends StatefulWidget {
  static const route_name = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    UserService.shared.getUserData();
  }

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
