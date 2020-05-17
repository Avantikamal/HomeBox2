import 'package:flutter/material.dart';
import 'package:homebox/screens/Dashboard.dart';
import 'package:homebox/screens/Intro.dart';
import 'package:homebox/screens/splash.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool _switchVal = false;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => Intro(),
        '/Dashboard': (BuildContext context) => Dashboard()
      },
    );
  }
}
