//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:homebox/Widgets/slide_item.dart';
//import 'package:homebox/Widgets/slide_list.dart';
//import 'dart:async';
//
//class IntoPage extends StatefulWidget {
//  @override
//  _IntoPageState createState() => _IntoPageState();
//}
//
//class _IntoPageState extends State<IntoPage> {
//int currentPage=0;
//final PageController _pageController=PageController(
//  initialPage: 0
//);
//
//@override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
////    Timer.periodic(Duration(seconds: 5), ( Timer timer) {
////if (currentPage <3){
////  currentPage++;
////}
////else{
////  currentPage=0;
////}
////_pageController.animateToPage(currentPage,duration: Duration(milliseconds: 300),curve: Curves.easeIn);
////    });
//
//  }
//
//_onPageChanged(int index){
//
//  setState(() {
//    currentPage=index;
//  });
//
//}
//@override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    _pageController.dispose();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        color: Colors.white,
//        child: Padding(
//          padding: const EdgeInsets.all(20.0),
//          child: Column(
//            children: <Widget>[
//              Expanded(
//                child: PageView.builder(
//                  controller: _pageController,
//                  scrollDirection: Axis.horizontal,
//                  onPageChanged: _onPageChanged,
//                  itemCount: slideList.length,
//                    itemBuilder: (context,i)=>
//                Slide_item(i)),
//              ),
//              SizedBox(height: 20.0),
//              Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: <Widget>[
//                  Container(
//                    color: Colors.red,
//                    child: FlatButton(onPressed: null,
//                      child: Text('Getting started',style: TextStyle(
//                        color: Colors.white
//                            ,fontSize: 18.0
//                      ),),
//                      padding: EdgeInsets.all(15.0),
//                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//
//                    ),
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text('Have an account?',style: TextStyle(
//                        fontSize: 18
//                      ),),
//                      FlatButton(onPressed: null,
//                        child: Text('Login',style: TextStyle(fontSize: 18)),
//                      ),
//                    ],
//                  )
//
//                ],
//              ),
//            ],
//          ),
//        ),
//      ),
//
//    );
//
//  }
//
//
//}
