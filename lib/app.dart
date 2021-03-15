import 'package:flutter/material.dart';
import 'package:flutter_form_validation/design/canes_color.dart';
import 'package:flutter_form_validation/ui/screen/home_screen.dart';
import 'package:flutter_form_validation/ui/screen/landing_screen.dart';
import 'package:flutter_form_validation/ui/screen/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CanesColor.colorBrand,
      ),
      title: 'Material App',
      initialRoute: LandingScreen.routeName,
      routes: {
        LandingScreen.routeName: (BuildContext context) => LandingScreen(),
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
      },
    );
  }
}
