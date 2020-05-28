import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homebox/VendorPart/bottomBar.dart';
import 'package:homebox/screens/Login.dart';
import 'package:homebox/screens/bottomNavBar.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Intro extends StatefulWidget {
  @override
  _Intro createState() => _Intro();
}

final auth = FirebaseAuth.instance;
// final reference = FirebaseDatabase.instance.reference();

class _Intro extends State<Intro> {
  void check() {
    auth.currentUser().then((value) {
      if (value != null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => BottomBar()), (_) => false);
        if (value.displayName == "vendor") {
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
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (_) => false);
      }
    });
  }

  List<Slide> slides = new List();
  Function goToTab;
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "ORGANICO",
        styleTitle: TextStyle(
          color: Color(0xff61ce70),
          fontSize: 42.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          shadows: [
            Shadow( // bottomLeft
                offset: Offset(-1.0, -1.0),
                color: Colors.black
            ),
            Shadow( // bottomRight
                offset: Offset(1.0, -1.0),
                color: Colors.black
            ),
            Shadow( // topRight
                offset: Offset(1.0, 1.0),
                color: Colors.black
            ),
            Shadow( // topLeft
                offset: Offset(-1.0, 1.0),
                color: Colors.black
            ),
            Shadow(
                blurRadius: 10.0,
                color: Colors.black54,
                offset: Offset.fromDirection(45, 10.0))
          ],
        ),
        description: '''
HomeBox introduces ORGANICO.
Now Get your Organic items
delivered at your doorstep.
Eat Organic, Stay Healthy.''',
        styleDescription: TextStyle(
            color: Colors.black, fontSize: 14.0, fontFamily: 'Poppins'),
        pathImage: "assets/images/organic-food.png",
      ),
    );

    slides.add(
      new Slide(
        title: "Order from your Home",
        styleTitle: TextStyle(
            color: Color(0xff61ce70),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Content",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/logo/food.png",
      ),
    );

    slides.add(
      new Slide(
        title: "NearBy Vendors",
        styleTitle: TextStyle(
            color: Color(0xff61ce70),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Content",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/logo/food.png",
      ),
    );

    slides.add(
      new Slide(
        title: "Delivery at your Doorstep",
        styleTitle: TextStyle(
            color: Color(0xff61ce70),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Content",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/logo/delivery.png",
      ),
    );
  }

  void onDonePress() {
    check();
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Text("Next");
  }

  Widget renderDoneBtn() {
    return GestureDetector(
        onTap: () {
          check();
        },
        child: Text("Done"));
  }

  Widget renderSkipBtn() {
    return Text("Skip");
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new IntroSlider(
        // List slides
        slides: this.slides,

        // Skip button
        renderSkipBtn: this.renderSkipBtn(),
        colorSkipBtn: Color(0xff61ce70),
        highlightColorSkipBtn: Color(0xff61ce70),

        // Next button
        renderNextBtn: this.renderNextBtn(),

        // Done button
        renderDoneBtn: this.renderDoneBtn(),
        onDonePress: this.onDonePress,
        colorDoneBtn: Color(0xff61ce70),
        highlightColorDoneBtn: Color(0xff61ce70),

        // Dot indicator
        colorDot: Colors.black12,
        colorActiveDot: Color(0xff61ce70),
        sizeDot: 15.0,
        typeDotAnimation: dotSliderAnimation.DOT_MOVEMENT,

        // Tabs
        listCustomTabs: this.renderListCustomTabs(),
        backgroundColorAllSlides: Colors.white,
        refFuncGoToTab: (refFunc) {
          this.goToTab = refFunc;
        },

        // Show or hide status bar
        shouldHideStatusBar: true,

        // On tab change completed
        onTabChangeCompleted: this.onTabChangeCompleted,
      ),
    );
  }
}
