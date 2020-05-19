import 'package:flutter/material.dart';

class Vendor extends StatefulWidget {
  @override
  _Vendor createState() => _Vendor();
}

class _Vendor extends State<Vendor> {
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
      body: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          height: 124.0,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 46.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                offset: Offset(0.0, 10.0),
                              ),
                            ],
                          ),
                          child: Text(
                            "Vendor$index",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                            textAlign: TextAlign.center,
                          )),
                      planetThumbnail,
                    ],
                  ));
            },
          )),
    );
  }
}

final planetThumbnail = Container(
    margin: EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: Container(
      color: Color(0xff0eb33d),
      height: 100,
      width: 100,
    ));

// Image(
//     image: AssetImage("assets/logo/bread.png"),
//     height: 92.0,
//     width: 92.0,
//   ),
