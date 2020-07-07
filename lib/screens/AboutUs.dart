import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'AllCategories.dart';
import 'Contact.dart';
import 'MyCart.dart';
import 'MyOrders.dart';

class aboutUs extends StatefulWidget {
  @override
  _aboutUsState createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> with SingleTickerProviderStateMixin {
  bool _iscollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  var _isSelected = 2;

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
                                  builder: (context) => AllCatagories()));
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
                                  builder: (context) => MyOrders()));
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
                                  builder: (context) => AllCatagories()));
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
                        'About Us',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => myCart()));
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
                  Container(
                    height: 0.3 * screenHeight,
                    width: screenWidth,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/images/p3.jpg'),
                          fit: BoxFit.cover,
                          color: Colors.black87,
                          colorBlendMode: BlendMode.darken,
                        ),
                        Center(
                          child: Text(
                            'OUR STORY',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '''
We a bunch of four students from Narsee Monjee Institute of Mangemnt Industries found a need of online grocery system and delivery of Organic fruits and vegetables in India.
We then decided to make one which will provides all home essential items and grocery items and organic essentials at the doorstep of the customer with easy return and free delivery within minimum span of time.
''',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '''“You feel obligated to put something healthy in your cart so that others don't judge you”''',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Text(
                      'WHY CHOOSE US',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineX: 0.7,
                    isFirst: true,
                    bottomLineStyle: LineStyle(
                      width: 4,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Color(0xff61ce70),
                      indicatorY: 0.5,
                      padding: EdgeInsets.all(8),
                    ),
                    leftChild: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        constraints: const BoxConstraints(
                          minHeight: 250,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                color: Theme.of(context).primaryColor,
                                size: 42.0,
                              ),
                              Center(
                                child: Text(
                                  'Free Delivery',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 3.0),
                                  child: Text(
                                    'With HomeBox now get your favorite groceries and home essentials at your Doorstep.',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const TimelineDivider(
                    begin: 0.1,
                    end: 0.7,
                    thickness: 4,
                    color: ThemeMode.dark != null ? Colors.white : Colors.black,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineX: 0.1,
                    isFirst: false,
                    isLast: false,
                    bottomLineStyle: LineStyle(
                      width: 4,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    topLineStyle: LineStyle(
                      width: 4,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Color(0xff61ce70),
                      indicatorY: 0.5,
                      padding: EdgeInsets.all(8),
                    ),
                    rightChild: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        constraints: const BoxConstraints(
                          minHeight: 250,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.rotate_90_degrees_ccw,
                                color: Theme.of(context).primaryColor,
                                size: 42.0,
                              ),
                              Center(
                                child: Text(
                                  'Instant Return',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 3.0),
                                  child: Text(
                                    'If you want to return any product then you can return it instantly at your doorstep and take the refund back',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const TimelineDivider(
                    begin: 0.1,
                    end: 0.7,
                    thickness: 4,
                    color: ThemeMode.dark != null ? Colors.white : Colors.black,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineX: 0.7,
                    isFirst: false,
                    isLast: false,
                    bottomLineStyle: LineStyle(
                      width: 4,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    topLineStyle: LineStyle(
                      width: 4,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Color(0xff61ce70),
                      indicatorY: 0.5,
                      padding: EdgeInsets.all(8),
                    ),
                    leftChild: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        constraints: const BoxConstraints(
                          minHeight: 250,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.account_balance_wallet,
                                color: Theme.of(context).primaryColor,
                                size: 42.0,
                              ),
                              Center(
                                child: Text(
                                  'Secure Payment',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 3.0),
                                  child: Text(
                                    'on-spot payment after recieving your complete order.',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const TimelineDivider(
                    begin: 0.1,
                    end: 0.7,
                    thickness: 4,
                    color: ThemeMode.dark != null ? Colors.white : Colors.black,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineX: 0.1,
                    isLast: true,
                    topLineStyle: LineStyle(
                      width: 4,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: Color(0xff61ce70),
                      indicatorY: 0.5,
                      padding: EdgeInsets.all(8),
                    ),
                    rightChild: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        constraints: const BoxConstraints(
                          minHeight: 250,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.info,
                                color: Theme.of(context).primaryColor,
                                size: 42.0,
                              ),
                              Center(
                                child: Text(
                                  '24X7 Support',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 3.0),
                                  child: Text(
                                    'Our Team is ready to listen your queries  24X7.',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
}
