
//import 'package:flutter/material.dart';
//import 'package:homebox/screens/AllCategories.dart';
//import 'package:homebox/screens/MyCart.dart';
//import 'screens/Orders.dart';
//import 'package:homebox/screens/profile.dart';
//
//class home extends StatefulWidget {
//  @override
//  _homeState createState() => _homeState();
//}
//
//class _homeState extends State<home> {
//int _currentIndex=0;
//  final List<Widget> _children = [
//    AllCatagories(),
//    MyCart(),
//    Orders(),
//   Profile(),
//  ];
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: _children[_currentIndex],
//
//        bottomNavigationBar: BottomNavigationBar(
//          currentIndex: _currentIndex,
//        onTap: (index){
//            setState(() {
//_currentIndex=index;
//            });
//        },
//        selectedItemColor: Colors.red,
//        backgroundColor: Colors.white,
//        type: BottomNavigationBarType.fixed,
//        items: <BottomNavigationBarItem>[
//        BottomNavigationBarItem(
//        icon: Icon(
//        Icons.home,
//    ),
//    title: Text("Home"),
//    ),
//    BottomNavigationBarItem(
//    icon: Icon(
//    Icons.shopping_cart,
//
//    ),
//    title: Text("My cart"),
//    ),
//    BottomNavigationBarItem(
//    icon: Icon(
//    Icons.favorite
//
//    ),
//    title: Text("My Orders"),
//
//    ),
//    BottomNavigationBarItem(
//    icon: Icon(
//    Icons.person,
//    ),
//    title: Text("Profile"),
//    ),
//    ],
//
//    )
//    );
//  }
//}
