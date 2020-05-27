import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homebox/screens/splash.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrders createState() => _MyOrders();
}

class _MyOrders extends State<MyOrders> {
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
      body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection("vendor")
              .document(userID)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            List<dynamic> va = snapshot.data.data['customerOrder'];
            print(snapshot.toString());
            return ListView.builder(
                itemCount: va.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4.8,
                                      child: Column(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                                va[index]['productName']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30)),
                                          ),
                                          SizedBox(height: 20),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                    "Price:  Rs." +
                                                        va[index]['price']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              )),
                                          SizedBox(height: 10),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                    "Quantity:  " +
                                                        va[index]['quantity']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              )),
                                          SizedBox(height: 10),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                    "Number Of Items:  " +
                                                        va[index][
                                                                'number Of Items']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              )),
                                        ],
                                      )));
                });
          }),
    );
  }
}
