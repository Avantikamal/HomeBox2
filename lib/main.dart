import 'package:flutter/material.dart';
import 'package:homebox/screens/Login_screen.dart';
import 'package:homebox/screens/dashboard.dart';
import 'screens/splash.dart';

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
        appBarTheme: AppBarTheme(
          color: Color(0xff61ce70),
          elevation: 8.0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        fontFamily: 'Poppins',
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          headline3: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        primaryColorDark: Colors.white,
        accentColor: Color(0xff61ce70),
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          color: Color(0xff61ce70),
          elevation: 8.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          headline3: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home:  Splash_screen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => Dashboard(),
        '/Login': (BuildContext context) => LoginScreen()
      },
    );
  }
}
