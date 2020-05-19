import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Fire extends StatefulWidget{
  @override
  _Fire createState()=> _Fire();
}

class _Fire extends State<Fire>{
  final databaseReference = Firestore.instance;
  @override
  Widget build(BuildContext context){
    return Scaffold(

    );

  }
}