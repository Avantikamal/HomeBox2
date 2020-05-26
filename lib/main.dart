import 'package:flutter/material.dart';
import 'package:homebox/screens/Intro.dart';
import 'package:homebox/screens/splash.dart';
void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => Intro(),
      },
    );
  }
}
