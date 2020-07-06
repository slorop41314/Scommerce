import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/service/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  static const route_name = "ProfileScreen";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              "Profile Screen",
            ),
            FlatButton(
              onPressed: () {
                AuthService.shared.logoutUser();
                Navigator.of(context).pushReplacementNamed("/");
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
