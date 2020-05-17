import 'package:flutter/material.dart';
import 'package:homebox/screens/Intro.dart';
import 'package:homebox/screens/Login.dart';
import 'package:homebox/screens/splash.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => Login(),
        // '/Dashboard': (BuildContext context) => Dashboard()
      },
    );
  }
}
