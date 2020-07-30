import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';


class Refer_earn extends StatefulWidget {
  @override
  _Refer_earnState createState() => _Refer_earnState();
}

class _Refer_earnState extends State<Refer_earn> {
  static const platform = MethodChannel('flutter.native/helper');
  String shareResponse = "Sharing";

  Future<String> shareApp() async {
    String response = "";
    try {
      String result = await platform.invokeMethod("shareApp");
      print("METHOD : " + result);
      response = result;
    } on PlatformException catch (e) {
      response = "Failed "
          "to shared app";
    }
    setState(() {
      shareResponse = response;
    });
    return shareResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Invite Friends",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Builder(
        builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[createHeader(),
                  //createMiddle()],
                ]),
                flex: 90,
              ),
              createFooter(context)
            ],
          );
        },
      ),
    );
  }

  Expanded createFooter(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 4, right: 4, bottom: 4),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 16),
                onPressed: () {
                  shareApp();
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(shareResponse)));
                },
                color: Colors.blue,
                child: Text(
                  "Share Link",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            flex: 85,
          ),
//          Expanded(
//            child: Container(
//              margin: EdgeInsets.only(right: 4, bottom: 8, top: 6),
//              child: RaisedButton(
//                padding: EdgeInsets.symmetric(vertical: 14),
//                onPressed: () {},
//                child: Image(
//                  image: AssetImage("images/ic_qr_code.png"),
//                  color: Colors.white,
//                ),
//                color: Colors.blue,
//              ),
//            ),
//            flex: 15,
//          )
        ],
      ),
      flex: 10,
    );
  }

  createHeader() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 160,
            margin: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/refer.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "Refer & Earn Points",
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "Refer your friends & earn exciting deals and offers.",
                style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }

//  createMiddle() {
//    return Container(
//      margin: EdgeInsets.only(top: 14),
//      color: Colors.white,
//      child: Column(
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(
//                  "My Invitation",
//                  style: TextStyle(
//                      fontSize: 14, color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.w600),
//                ),
//                Text(
//                  "Details",
//                  style: TextStyle(fontSize: 14, color: Colors.blue,fontWeight: FontWeight.w600),
//                ),
//              ],
//            ),
//          ),
//          Container(
//            color: Colors.grey.shade200,
//            height: 1,
//            width: double.infinity,
//          ),
//          Container(
//            height: 60,
//            child: GridView.builder(
//              gridDelegate:
//              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//              itemBuilder: (context, index) {
//                return gridItem();
//              },
//              itemCount: 2,
//              shrinkWrap: true,
//            ),
//          )
//        ],
//      ),
//    );
//  }

  gridItem() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        top: 8,
      ),
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         SizedBox(width: 8),
          Icon(
            Icons.menu,
            color: Colors.blue,
          ),
         SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "0.34123205",
                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 4),
              Container(
                child: Text(
                  "Today Reward",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12,fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}