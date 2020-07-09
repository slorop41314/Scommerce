import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/service/auth_service.dart';
import 'package:flutter_ecommerce/ui/views/bottom_tab.dart';
import 'package:flutter_ecommerce/ui/views/registration/login_screen.dart';
import 'package:flutter_ecommerce/utils/image_path.dart';

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
      Navigator.of(context).pushReplacementNamed(BottomNavBar.route_name);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginScreen.route_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            imgLogoPath,
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
