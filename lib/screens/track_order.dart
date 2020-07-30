import 'package:flutter/material.dart';
class Track_Order extends StatefulWidget {
  @override
  _Track_OrderState createState() => _Track_OrderState();
}

class _Track_OrderState extends State<Track_Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=>
            Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('Track your order',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0
        ),),
        centerTitle: true,
      ),
      body: Column(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70.0,
              color: Colors.red.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Estimated Delivery Time',style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 3.0,),
                  Text('04.00 PM,01 Feb 2020',style: TextStyle(
                    color: Colors.red,
                    fontSize: 18.0
                  ),),

                ],
              ),
            ),
          ),
          
Padding(
  padding: const EdgeInsets.only(top:430.0),
  child:   Container(
    height: 146.0,
    width: MediaQuery.of(context).size.width,

    decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        )
    ),
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:30.0,right: 4.0),
          child: CircleAvatar(
            radius: 26.0,
          ),
        ),
        SizedBox(width: 3.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Your Rider',style: TextStyle(
              fontWeight: FontWeight.w300
            ),),
            SizedBox(height: 2.0,),
            Text('Robert',style: TextStyle(
              fontWeight: FontWeight.w700
            ),),
          ],
        ),
        SizedBox(width: 40.0,),
        Padding(
          padding: const EdgeInsets.only(left:100.0),
          child: FloatingActionButton(
            backgroundColor: Colors.green.shade700,
            onPressed: () {  },
            child: Icon(Icons.phone,color: Colors.white,),
          ),
        )
      ],
    ),
  ),
)
        ],
      ),
    );
  }
}
