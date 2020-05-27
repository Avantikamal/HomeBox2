import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homebox/screens/splash.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
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
        body: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection("users")
                .document(userID)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasData) {
                List<dynamic> data = snapshot.data.data['orders'];
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(10, 10),
                                        blurRadius: 10),
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-5, -5),
                                        blurRadius: 10)
                                  ]),
                              height: MediaQuery.of(context).size.height / 5,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                        data[index]['productName'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30)),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            "Price:  Rs." +
                                                data[index]['price'].toString(),
                                            style: TextStyle(fontSize: 20)),
                                      )),
                                  SizedBox(height: 10),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            "Quantity:  " +
                                                data[index]['quantity']
                                                    .toString(),
                                            style: TextStyle(fontSize: 20)),
                                      )),
                                  SizedBox(height: 10),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            "Number Of Items:  " +
                                                data[index]['number Of Items']
                                                    .toString(),
                                            style: TextStyle(fontSize: 20)),
                                      ))
                                ],
                              )));
                    });
              }
              else{
                return Center(child:SpinKitDualRing(color: Colors.black),);
              }
            }));
  }
}
