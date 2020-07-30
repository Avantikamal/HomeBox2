//import 'package:flutter/material.dart';
//import 'package:homebox/Widgets/slide_list.dart';
//
//class Slide_item extends StatelessWidget {
// final int index;
// Slide_item(this.index);
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.center,
//      children: <Widget>[
//        Container(
//          width: 350,
//          height: 200,
//          decoration: BoxDecoration(
//
//              image: DecorationImage(
//                  image: AssetImage(slideList[index].imageUrl)
//                  ,fit: BoxFit.cover)
//
//          ),
//        ),
//        SizedBox(height: 40.0),
//        Text(slideList[index].title,
//          style: TextStyle(
//            color: Color(0xff61ce70),
//            fontSize: 42.0,
//            fontWeight: FontWeight.bold,
//            fontFamily: 'Poppins',
//            shadows: [
//              Shadow(
//                // bottomLeft
//                  offset: Offset(-1.0, -1.0),
//                  color: Colors.black),
//              Shadow(
//                // bottomRight
//                  offset: Offset(1.0, -1.0),
//                  color: Colors.black),
//              Shadow(
//                // topRight
//                  offset: Offset(1.0, 1.0),
//                  color: Colors.black),
//              Shadow(
//                // topLeft
//                  offset: Offset(-1.0, 1.0),
//                  color: Colors.black),
//              Shadow(
//                  blurRadius: 10.0,
//                  color: Colors.black54,
//                  offset: Offset.fromDirection(45, 10.0))
//            ],
//          ),),
//        SizedBox(height: 20.0),
//        Text(slideList[index].description,
//          textAlign: TextAlign.center,
//          style: TextStyle(
//            color: Colors.black,
//            fontSize: 20.0,
//            fontFamily: 'Poppins',
//            shadows: [
//              Shadow(
//                // bottomLeft
//                  offset: Offset(-1.0, -1.0),
//                  color: Color(0xff61ce70)),
//              Shadow(
//                // bottomRight
//                  offset: Offset(1.0, -1.0),
//                  color: Color(0xff61ce70)),
//              Shadow(
//                // topRight
//                  offset: Offset(1.0, 1.0),
//                  color: Color(0xff61ce70)),
//              Shadow(
//                // topLeft
//                  offset: Offset(-1.0, 1.0),
//                  color: Color(0xff61ce70)),
//              Shadow(
//                  blurRadius: 10.0,
//                  color: Colors.black54,
//                  offset: Offset.fromDirection(45, 10.0))
//            ],
//          ),)
//      ],
//    );;
//  }
//}
