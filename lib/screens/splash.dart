import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:homebox/VendorPart/bottomBar.dart';
import 'package:homebox/screens/Login.dart';

import 'bottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

String userID;

class _SplashScreen extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void navigationPage() {
    _auth.currentUser().then((value) {
      if (value != null) {
        print(value.displayName);
        if (value.displayName == "vendor") {
          userID = value.uid;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BottomBarVendor()),
              (_) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BottomBar()),
              (_) => false);
        }
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => Login()),
            (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
            child: Container(
              color: Color(0xff61ce70),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo/logo1.png'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(
                      child: SpinKitFadingCube(
                    color: Colors.black,
                    size: 25.0,
                  ))
                ],
              ),
            )));
  }
}
