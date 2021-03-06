import 'package:contactus/contactus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homebox/screens/dashboard.dart';

import 'AboutUs.dart';

import 'MyCart.dart';
import 'Checkout.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> with SingleTickerProviderStateMixin {
  bool _iscollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  var _isSelected = 3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Center(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          body: Stack(
            children: <Widget>[
              menu(context),
              dashboard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isSelected != 0) {
                          _isSelected = 0;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        }
                      });
                    },
                    child: Container(
                      width: 0.5 * screenWidth,
                      height: 0.05 * screenHeight,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: _isSelected == 0
                            ? Color(0xff3d8f48)
                            : Theme.of(context).accentColor,
                      ),
                      child: Text(
                        "All Catagories",
                        style: _isSelected == 0
                            ? Theme.of(context).textTheme.headline5
                            : Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isSelected != 1) {
                          _isSelected = 1;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout()));
                        }
                      });
                    },
                    child: Container(
                      width: 0.5 * screenWidth,
                      height: 0.05 * screenHeight,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: _isSelected == 1
                            ? Color(0xff3d8f48)
                            : Theme.of(context).accentColor,
                      ),
                      child: Text(
                        "My Orders",
                        style: _isSelected == 1
                            ? Theme.of(context).textTheme.headline5
                            : Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isSelected != 2) {
                          _isSelected = 2;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => aboutUs()));
                        }
                      });
                    },
                    child: Container(
                      width: 0.5 * screenWidth,
                      height: 0.05 * screenHeight,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: _isSelected == 2
                            ? Color(0xff3d8f48)
                            : Theme.of(context).accentColor,
                      ),
                      child: Text(
                        "About Us",
                        style: _isSelected == 2
                            ? Theme.of(context).textTheme.headline5
                            : Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isSelected != 3) {
                          _isSelected = 3;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contact()));
                        }
                      });
                    },
                    child: Container(
                      width: 0.5 * screenWidth,
                      height: 0.05 * screenHeight,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: _isSelected == 3
                            ? Color(0xff3d8f48)
                            : Theme.of(context).accentColor,
                      ),
                      child: Text(
                        "Contact Us",
                        style: _isSelected == 3
                            ? Theme.of(context).textTheme.headline5
                            : Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isSelected != 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        }
                      });
                    },
                    child: Container(
                      width: 0.5 * screenWidth,
                      height: 0.05 * screenHeight,
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Log Out",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(cotext) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: _iscollapsed ? 0 : 0.6 * screenWidth,
      right: _iscollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          elevation: 10.0,
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (_iscollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            _iscollapsed = !_iscollapsed;
                          });
                        },
                        child: Icon(
                          Icons.menu,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      Text(
                        'ContactUs',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyCart()));
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ContactUs(
                    logo: AssetImage('assets/logo/logo1.png'),
                    tagLine: 'Eat Healty, Stay Safe',
                    taglineColor: Color(0xff61ce70),
                    companyName: 'HomeBox',
                    companyColor: Color(0xff61ce70),
                    website: 'homebox.co.in',
                    email: 'homebox.technical@gmail.com',
                    phoneNumber: '+911234567890',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
