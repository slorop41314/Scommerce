import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static const route_name = "NotificationScreen";
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Notif screen"),
          ],
        ),
      ),
    );
  }
}
