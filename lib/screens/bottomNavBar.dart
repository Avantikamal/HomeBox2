import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:homebox/screens/Contact.dart';
import 'package:line_icons/line_icons.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBar createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOption = [
    AllCatagory(docID: 'TrH35yGujGhwnaeWGhKz6SNPGhp1'),
    AddBox(),
    Contact(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _widgetOption.elementAt(_selectedIndex)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                  gap: 6,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  duration: Duration(milliseconds: 800),
                  tabBackgroundColor: Colors.grey[800],
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'DashBoard',
                    ),
                    GButton(
                      icon: LineIcons.shopping_cart,
                      text: 'My Box',
                    ),
                    GButton(
                      icon: LineIcons.phone,
                      text: 'Contact Us',
                    ),
                    GButton(
                      icon: LineIcons.list,
                      text: 'My Orders',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }),
            ),
          ),
        ));
  }
}
