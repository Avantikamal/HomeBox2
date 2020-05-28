import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: StreamBuilder<DocumentSnapshot>(
          stream:
              Firestore.instance.collection("vendor").document().snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            dynamic data = snapshot.data.documentID;

            return Text(data.toString());
          }),
    );
  }
}
