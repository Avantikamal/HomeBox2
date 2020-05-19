import 'package:flutter/material.dart';
import 'package:homebox/Shared/Modal.dart';
import 'package:homebox/Shared/newModel.dart';

Scaffold allItems(BuildContext context, name) {
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
        child: Stack(
      children: <Widget>[
        Text(
          "$name",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Padding(
            padding: EdgeInsets.only(top: 60),
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      newsettingModalBottomSheet(
                          context, 'quantity', 'price', 'Item$index');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Item$index",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Qunatity:",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.left),
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Price:",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.left,
                                )),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  );
                }))
      ],
    )),
  );
}
