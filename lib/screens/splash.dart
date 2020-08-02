//import 'dart:async';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:homebox/screens/Intro.dart';
//
//class SplashScrn extends StatefulWidget {
//  @override
//  _SplashScrnState createState() => _SplashScrnState();
//}
//
//class _SplashScrnState extends State<SplashScrn> {
//  @override
//  void initState() {
//    super.initState();
//    Timer(
//      Duration(seconds: 5),
//     () => Navigator.of(context).pushReplacement(
//        MaterialPageRoute(builder: (context) => Intro())));
//// Navigator.push(
////        context,
////        MaterialPageRoute(builder: (context) => Intro()),
////      ),
////    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Stack(
//        fit: StackFit.expand,
//        children: <Widget>[
//          Container(
//            decoration: BoxDecoration(color: Colors.white),
//          ),
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Image.asset('assets/logo/logo1.png'),
//              SizedBox(
//                height: 5,
//              ),
//              /*Text(
//                'HomeBox',
//                style: TextStyle(
//                  color: Color(0xff61ce70),
//                  fontSize: 24.0,
//                  fontWeight: FontWeight.bold,
//                  fontFamily: 'Poppins',
//                  shadows: [
//                    Shadow(
//                      // bottomLeft
//                        offset: Offset(-1.0, -1.0),
//                        color: Colors.black),
//                    Shadow(
//                      // bottomRight
//                        offset: Offset(1.0, -1.0),
//                        color: Colors.black),
//                    Shadow(
//                      // topRight
//                        offset: Offset(1.0, 1.0),
//                        color: Colors.black),
//                    Shadow(
//                      // topLeft
//                        offset: Offset(-1.0, 1.0),
//                        color: Colors.black),
//                    Shadow(
//                        blurRadius: 10.0,
//                        color: Colors.black54,
//                        offset: Offset.fromDirection(45, 10.0))
//                  ],
//                ),
//              ),*/
//              SizedBox(
//                height: 30,
//              ),
//              Text(
//                'Eat Healthy, Stay Safe',
//                style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 22.0,
//                  fontWeight: FontWeight.bold,
//                  fontFamily: 'Poppins',
//                  shadows: [
//                    Shadow(
//                        // bottomLeft
//                        offset: Offset(-1.0, -1.0),
//                        color: Color(0xff61ce70)),
//                    Shadow(
//                        // bottomRight
//                        offset: Offset(1.0, -1.0),
//                        color: Color(0xff61ce70)),
//                    Shadow(
//                        // topRight
//                        offset: Offset(1.0, 1.0),
//                        color: Color(0xff61ce70)),
//                    Shadow(
//                        // topLeft
//                        offset: Offset(-1.0, 1.0),
//                        color: Color(0xff61ce70)),
//                    Shadow(
//                        blurRadius: 10.0,
//                        color: Colors.black54,
//                        offset: Offset.fromDirection(45, 10.0))
//                  ],
//                ),
//              ),
//              SizedBox(
//                height: 40,
//              ),
//              SpinKitFadingCube(
//                duration: const Duration(milliseconds: 500),
//                size: 25.0,
//                itemBuilder: (BuildContext context, int index) {
//                  return DecoratedBox(
//                    decoration: BoxDecoration(
//                      color: index.isEven ? Colors.black : Color(0xff61ce70),
//                    ),
//                  );
//                },
//              ),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//}
//alternate code

import 'package:flutter/material.dart';
import 'package:homebox/integration/auto_login.dart';
import 'dart:async';
import 'package:homebox/screens/add_location.dart';
import 'package:homebox/screens/onboarding_screen.dart';



class Splash_screen extends StatefulWidget {
  @override
  _Splash_screenState createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {

  String readToken = "";
  bool autoLogin=false;// counter for user auto login
  Future<bool> checkLogin() async {
    final readToken = await TokenService().readToken();
    if (readToken == "null") {
      // checks if user is already logged in
      return false;
    } else {
      setState(() {
        this.readToken = readToken;
      });
      return true;
    }
  }



  Future<bool> _delay() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _delay().then((status){
      if(status){
        checkLogin().then((value) {
          if (value) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
              return AddLocation(auth_token: readToken,);
            }));
          } else {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
              return Onboarding();
            }));
          }
        });
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,

          body: Stack(children: <Widget>[
            Container(
              // padding: EdgeInsets.only(left: 5.0,right: 3.0),
              //height: 400.0,
              width: 400.0,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                // color: Colors.redAccent,
                image: DecorationImage(
                  image: AssetImage('assets/images/splash4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ])),
    );
  }
}
