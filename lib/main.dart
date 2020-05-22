import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:homebox/Vendor%20Part/bottomBar.dart';
=======
import 'package:homebox/VendorPart/AddItems.dart';
import 'package:homebox/newLogin.dart';
>>>>>>> 1f82a6abbc6375ebd62f299b354874af993525e5
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
        accentColor: Color(0xff61ce70),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Color(0xff61ce70),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home:BottomBarVendor(),
=======
      home: Login(),
>>>>>>> 1f82a6abbc6375ebd62f299b354874af993525e5
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => Intro(),
      },
    );
  }
}
