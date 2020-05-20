import 'package:flutter/material.dart';

class VendorChoice extends StatefulWidget {
  @override
  _VendorChoice createState() => _VendorChoice();
}

class _VendorChoice extends State<VendorChoice> {
  List<String> _products = ['Asshirvad Aata', 'Bhavnagar', 'Bharuch'];
  List<String> _products2 = ['b', 'a', 'c'];
  List<String> _products3 = ['c', 'b', 'a'];
  List<String> _products4 = ['a', 'b', 'c'];

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
      body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("Add Data According to HomeBox",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      )),
                  SizedBox(height: 40),
                  Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("Add Data According to You",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      )),
                ],
              ))),
    );
  }
}
