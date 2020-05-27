import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
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
String vendorId;

class _SplashScreen extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void navigationPage() async {
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      print(user.displayName);
      if (user.displayName == "vendor") {
        userID = user.uid;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomBarVendor()),
            (_) => false);
      } else {
        DocumentSnapshot temp = await Firestore.instance
            .collection("users")
            .document(user.uid)
            .get();
        vendorId = temp.data["vendor"];
        userID = user.uid;
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => BottomBar()), (_) => false);
      }
    } else {
      Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (context) => Login()), (route) => false);
    }
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo/splash.png'))),
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
