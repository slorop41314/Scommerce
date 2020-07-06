import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/views/home/home.dart';
import 'package:flutter_ecommerce/ui/views/registration/login.dart';
import 'package:flutter_ecommerce/ui/views/registration/register.dart';
import 'package:flutter_ecommerce/ui/views/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (context) => SplashScreen(),

        // Registration Screen
        RegisterScreen.route_name: (context) => RegisterScreen(),
        LoginScreen.route_name: (context) => LoginScreen(),

        // Auth screen
        HomeScreen.route_name: (context) => HomeScreen(),
      },
    );
  }
}
