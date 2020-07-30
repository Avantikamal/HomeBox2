import 'package:flutter/material.dart';
class NoDelivery extends StatefulWidget {
  @override
  _NoDeliveryState createState() => _NoDeliveryState();
}

class _NoDeliveryState extends State<NoDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text('Hey!Sorry our delivery is not available to your place')
      ),
    );
  }
}
