import 'package:flutter/material.dart';

class OrganicFarm extends StatelessWidget {
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
        body: Container(
      child: Center(
          child: Column(
        children: <Widget>[
          Image.asset(
            "assets/images/empty.png",
            width: MediaQuery.of(context).size.width - 100,
          ),
          Text(
            "Coming Soon.....",
            style: TextStyle(
                fontSize: 25.0, color: Colors.amber, fontFamily: "Poppins"),
          )
        ],
      )),
    ));
  }
}
