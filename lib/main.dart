import 'package:flutter/material.dart';
import 'package:homebox/screens/Intro.dart';
import 'package:homebox/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => Intro()
      },
    );
  }
}
