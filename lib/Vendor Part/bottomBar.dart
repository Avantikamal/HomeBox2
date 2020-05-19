import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:homebox/Vendor%20Part/AddItems.dart';
import 'package:homebox/screens/Contact.dart';
import 'package:line_icons/line_icons.dart';

class BottomBarVendor extends StatefulWidget {
  @override
  _BottomBarVendor createState() => _BottomBarVendor();
}

class _BottomBarVendor extends State<BottomBarVendor> {
  int _selectedIndex = 0;
  List<Widget> _widgetOption = [
    AddItems(),
    AddItems(),
    Contact(),
    Contact()
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
                      text: 'My Items',
                    ),
                    GButton(
                      icon: LineIcons.shopping_cart,
                      text: 'Add Items',
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
