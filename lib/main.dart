import 'package:flutter/material.dart';
import 'package:homebox/VendorPart/AddItems.dart';
import 'package:homebox/newLogin.dart';
import 'package:homebox/screens/Intro.dart';
import 'package:homebox/screens/Login.dart';
import 'package:homebox/screens/LoginVendor.dart';
import 'package:homebox/screens/splash.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.teal,
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.teal,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => Intro(),
        // '/Dashboard': (BuildContext context) => Dashboard()
      },
    );
  }
}
