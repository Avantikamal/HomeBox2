import 'package:flutter/material.dart';
import 'package:homebox/models/product.dart';
import 'package:homebox/screens/Checkout.dart';
List<Product> items;

class New_Cart extends StatefulWidget {



  @override
  _New_CartState createState() => _New_CartState();
}

class _New_CartState extends State<New_Cart> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Your Cart',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23.0
          ),),
        centerTitle: true,
        leading:    IconButton(
            alignment: Alignment.topLeft,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {}),
      ),
      body: ListView.builder(itemCount: items.length ,
          itemBuilder: (BuildContext context,index)=>
    Container(
    padding: EdgeInsets.only(left: 15.0, right: 10.0, bottom: 0.0),
    width: MediaQuery.of(context).size.width - 20.0,
    height: 145.0,
    decoration: BoxDecoration(
    color: Colors.red.shade50,
    borderRadius: BorderRadius.circular(10.0)),
    child: Column(

    children: <Widget>[
    ListTile(
    leading:  Container(
    height: 80.0,
    width: 95.0,
    decoration: BoxDecoration(
    color: Colors.white,
    image: DecorationImage(
    image: AssetImage(items[index].image),
    fit: BoxFit.contain)),
    ),
    title:  Text(
    items[index].title,
    style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: Colors.black),
    ),
    subtitle:   Column(
    children: <Widget>[
    Text(
    'Net wt. ${items[index].title}',
    style: TextStyle(
    fontSize: 14, fontWeight: FontWeight.w300,
    color: Colors.grey.shade700),
    ),
    Text(items[index].price.toString(),
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.red,
    )),
    ],
    ),),

    ]

    )
    )
      ),
        bottomNavigationBar: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2)),
        color: Colors.red,
        child: Text(
          items.length==0?
              ' Browse Items':
              'Proceed to Checkout', style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w300),
        ),
        onPressed: ()=> items.length==0?
          Navigator.pop(context):
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout()))),
      );
  }
}
