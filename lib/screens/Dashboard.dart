import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homebox/Shared/Modal.dart';
import 'AllCatagory.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedindex = 0;
  var _switchVal;
  List<IconData> _icons = [
    FontAwesomeIcons.ccDinersClub,
    FontAwesomeIcons.coffee,
    FontAwesomeIcons.iceCream,
    FontAwesomeIcons.oilCan,
    FontAwesomeIcons.brush,
    Icons.fastfood
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedindex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: _selectedindex == index
                ? Theme.of(context).accentColor
                : Colors.white54,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: _selectedindex == index ? Colors.white : Colors.black38,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        centerTitle: true,
        title: Text(
          'HomeBox',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Our Vendors',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Organic Farms',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            ListTile(
              title: Text(
                'Deals Of The Day',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Stack(
                children: <Widget>[
                  Text(
                    "All Catagories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllCatagory()));
                      },
                      child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "View All >>",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xff61ce70)),
                              ))))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 80.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _icons
                          .asMap()
                          .entries
                          .map((MapEntry map) => _buildIcon(map.key))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Frequently Used Products:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      fontFamily: 'Poppins'),
                )),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10),
              child: Container(
                // ignore: unrelated_type_equality_checks
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          settingModalBottomSheet(
                            context,
                            'assets/images/bread.png',
                            'Rs. 40.0',
                            'Bread',
                          );
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: ThemeMode.dark == true
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 140,
                                child: Center(
                                    child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Image.asset(
                                          'assets/images/bread.png')),
                                ))),
                            SizedBox(height: 3),
                            Text(
                              "Bread",
                              style: TextStyle(
                                  fontSize: 30, fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Rs.20.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: ThemeMode.dark == true
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 140,
                                child: Center(
                                    child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Image.asset(
                                          'assets/images/amul.png')),
                                ))),
                            SizedBox(height: 3),
                            Text(
                              "Milk",
                              style: TextStyle(
                                  fontSize: 30, fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Rs.30.00/Lit.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Top Rated Products:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Poppins'),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10),
              child: Container(
                // ignore: unrelated_type_equality_checks
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: ThemeMode.dark == true
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 140,
                                child: Center(
                                    child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                          'assets/images/vegetable.png')),
                                ))),
                            SizedBox(height: 3),
                            Text(
                              "Vegetables",
                              style: TextStyle(
                                  fontSize: 30, fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Rs.20.00/Kg.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: ThemeMode.dark == true
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 140,
                                child: Center(
                                    child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                          'assets/images/sugar.png')),
                                ))),
                            SizedBox(height: 3),
                            Text(
                              "Sugar",
                              style: TextStyle(
                                  fontSize: 30, fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Rs.30.00/Kg.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
