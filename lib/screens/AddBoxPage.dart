import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homebox/Shared/Modal.dart';
import 'package:homebox/screens/splash.dart';

class AddBox extends StatefulWidget {
  @override
  _AddBox createState() => _AddBox();
}

class _AddBox extends State<AddBox> {
  var counter = 00;
  var firebaseUser = FirebaseAuth.instance.currentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection('users')
                .document(userID)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              List<dynamic> data = snapshot.data.data['carty'];
              return snapshot.data.data['carty'] !=null
                  ? Stack(
                      children: <Widget>[
                        ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              // List<dynamic> price = List.of(data[index]['price']);

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
                                                data[index]['productName']
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
                                                        data[index]['price']
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
                                                        data[index]['quantity']
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
                                                        data[index][
                                                                'number Of Items']
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              )),
                                        ],
                                      )));
                            }),
                        Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                  onTap: () {
                                    settingModalBottomSheet(
                                        context, 'price', data.length);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
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
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height:
                                        MediaQuery.of(context).size.height / 17,
                                    child: Center(
                                        child: Text(
                                      "Place Order",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  )),
                            ))
                      ],
                    )
                  : Center(
                      child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/empty.png",
                          width: MediaQuery.of(context).size.width - 100,
                        ),
                        Text(
                          "No Items Here",
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.amber,
                              fontFamily: "Poppins"),
                        )
                      ],
                    ));
            }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     settingModalBottomSheet(context, data[index]['productName'].toString(), 'address');
      //   },
      //   child: Icon(
      //     Icons.add,
      //     size: 35,
      //   ),
      //   backgroundColor: Colors.green,
      // ),
    );
  }
}
