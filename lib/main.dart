import 'package:flutter/material.dart';
import 'package:homebox/screens/Intro.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.black,
        accentColor: Color(0xff61ce70),
        fontFamily: 'Poppins',
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        primaryColorDark: Colors.white,
        accentColor: Color(0xff61ce70),
        fontFamily: 'Poppins',
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Intro(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => Intro(),
      },
    );
  }
}
