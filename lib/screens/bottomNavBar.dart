import 'package:flutter/material.dart';
import 'package:homebox/screens/AddBoxPage.dart';
import 'package:homebox/screens/Dashboard.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:homebox/screens/SettingPage.dart';
import 'package:line_icons/line_icons.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBar createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOption = [Dashboard(), AddBox(), Setting()];

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
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      icon: LineIcons.refresh,
                      text: 'Setting',
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
