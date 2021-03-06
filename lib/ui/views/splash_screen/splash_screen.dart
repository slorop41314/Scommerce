import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/service/auth_service.dart';
import 'package:flutter_ecommerce/ui/views/home/home.dart';
import 'package:flutter_ecommerce/ui/views/registration/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    final isUserLoggedIn = await AuthService.shared.checkCurrentUser();
    if (isUserLoggedIn) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.route_name);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginScreen.route_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Splash Screen"),
        ),
      ),
    );
  }
}
