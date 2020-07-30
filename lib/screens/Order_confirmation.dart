import 'package:flutter/material.dart';
import 'package:homebox/screens/AllCategories.dart';
import 'package:homebox/HomePage.dart';
import 'package:homebox/screens/dashboard.dart';
class Order_Confirmation extends StatefulWidget {
  @override
  _Order_ConfirmationState createState() => _Order_ConfirmationState();
}

class _Order_ConfirmationState extends State<Order_Confirmation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('Confirmation',
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.black,
              fontWeight: FontWeight.w800

          ),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 120.0,
                child: Image.asset('assets/images/tick.png')),
            SizedBox(height: 15.0,),
            Text('Your order has been successfully submitted!',style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey.shade600

            ),
            textAlign: TextAlign.center,),
            SizedBox(height: 20.0,),
            Text('Order Summary'
            ,style:  TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey.shade500

                ),),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width-16.0,
                height: 130.0,
               padding: EdgeInsets.only(left: 8.0,
               right: 8.0),
                color: Colors.grey.shade200,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 8.0,),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[

    Text('Total:'),
    Text('Rs.500'),
  ],
),
SizedBox(height: 8.0,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    Text('Delivery fee:'),
    Text('Rs.100'),
  ],
),
SizedBox(height: 8.0,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    Text('Discount:'),
    Text('Rs.200'),
  ],
),
SizedBox(height: 8.0,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    Text('Ordered on:'),
    Text('7th July,2020'),
  ],
),
SizedBox(height: 8.0,),

                  ],
                ),
              ),
            )


          ],
        ),
        bottomNavigationBar:


        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(35.0)
          ),
          width: MediaQuery.of(context).size.width-57.0,
          child: FlatButton(

            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Dashboard()
              ));
            },
              child: Text('Continue Shopping',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white

              ),),

          ),
        ),
      ),

    );
  }
}
