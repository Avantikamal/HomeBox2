import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homebox/screens/Intro.dart';

class SplashScrn extends StatefulWidget {
  @override
  _SplashScrnState createState() => _SplashScrnState();
}

class _SplashScrnState extends State<SplashScrn> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Intro()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo/logo1.png'),
              SizedBox(
                height: 5,
              ),
              /*Text(
                'HomeBox',
                style: TextStyle(
                  color: Color(0xff61ce70),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  shadows: [
                    Shadow(
                      // bottomLeft
                        offset: Offset(-1.0, -1.0),
                        color: Colors.black),
                    Shadow(
                      // bottomRight
                        offset: Offset(1.0, -1.0),
                        color: Colors.black),
                    Shadow(
                      // topRight
                        offset: Offset(1.0, 1.0),
                        color: Colors.black),
                    Shadow(
                      // topLeft
                        offset: Offset(-1.0, 1.0),
                        color: Colors.black),
                    Shadow(
                        blurRadius: 10.0,
                        color: Colors.black54,
                        offset: Offset.fromDirection(45, 10.0))
                  ],
                ),
              ),*/
              SizedBox(
                height: 30,
              ),
              Text(
                'Eat Healthy, Stay Safe',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  shadows: [
                    Shadow(
                        // bottomLeft
                        offset: Offset(-1.0, -1.0),
                        color: Color(0xff61ce70)),
                    Shadow(
                        // bottomRight
                        offset: Offset(1.0, -1.0),
                        color: Color(0xff61ce70)),
                    Shadow(
                        // topRight
                        offset: Offset(1.0, 1.0),
                        color: Color(0xff61ce70)),
                    Shadow(
                        // topLeft
                        offset: Offset(-1.0, 1.0),
                        color: Color(0xff61ce70)),
                    Shadow(
                        blurRadius: 10.0,
                        color: Colors.black54,
                        offset: Offset.fromDirection(45, 10.0))
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SpinKitFadingCube(
                duration: const Duration(milliseconds: 500),
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.black : Color(0xff61ce70),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
