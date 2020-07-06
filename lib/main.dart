import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/service/user_service.dart';
import 'package:flutter_ecommerce/ui/views/bottom_tab.dart';
import 'package:flutter_ecommerce/ui/views/home/home_screen.dart';
import 'package:flutter_ecommerce/ui/views/registration/login_screen.dart';
import 'package:flutter_ecommerce/ui/views/registration/register_screen.dart';
import 'package:flutter_ecommerce/ui/views/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: ((_) => UserService.shared.getUserData()),
        ),
      ],
      child: MaterialApp(
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
          BottomNavBar.route_name: (context) => BottomNavBar(),
          HomeScreen.route_name: (context) => HomeScreen(),
        },
      ),
    );
  }
}
