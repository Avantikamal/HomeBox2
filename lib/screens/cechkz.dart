import 'package:flutter/material.dart';

class exeute extends StatefulWidget {
  @override
  _exeute createState() => _exeute();
}

class _exeute extends State<exeute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: 50,
          width: 50,
          child: Center(child: Card(child: Text("Hello")))));
  }
}
