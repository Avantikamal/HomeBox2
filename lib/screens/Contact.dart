import 'package:contactus/contactus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              ContactUs(
                cardColor: Theme.of(context).accentColor,
                companyColor: Theme.of(context).accentColor,
                taglineColor: Theme.of(context).accentColor,
                textColor: Theme.of(context).primaryColor,
                logo: AssetImage('assets/logo/logo1.png'),
                email: 'Homebox.technical@gmail.com',
                companyName: 'HomeBox',
                phoneNumber: '+91123456789',
                website: 'https://homebox.co.in',
                tagLine: 'Delivery at your Doorstep',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
