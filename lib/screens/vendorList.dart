import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homebox/screens/AllCategory.dart';
import 'package:homebox/screens/bottomNavBar.dart';
import 'package:homebox/screens/splash.dart';

class VendorList extends StatefulWidget {
  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Select Shop",
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontFamily: "Poppins"),
        )),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("vendor").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      vendorId = snapshot.data.documents[index].documentID;
                      Firestore.instance
                          .collection("users")
                          .document(userID)
                          .updateData({
                        "vendor": snapshot.data.documents[index].documentID
                      }).whenComplete(() => Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => BottomBar()),
                              (route) => false));
                    },
                    child: Container(
                        margin: EdgeInsets.all(15.0),
                        width: MediaQuery.of(context).size.width,
                        height: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              snapshot.data.documents[index].data["name"],
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontFamily: "Poppins"),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(snapshot.data.documents[index].data["city"]),
                          ],
                        )),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
