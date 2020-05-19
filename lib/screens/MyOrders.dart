import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Our Vendors',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Organic Farms',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              ListTile(
                title: Text(
                  'Deals Of The Day',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Text('My Orders Page'),
            ),
          ),
        ),
      ),
    );
  }
}
