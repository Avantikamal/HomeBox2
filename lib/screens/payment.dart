import 'package:flutter/material.dart';
import 'package:homebox/screens/Order_confirmation.dart';

import 'Checkout.dart';
class Value {

  final String _value;
  Value(this._value);
}

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String _character = '';
  static List<PaymentMethod> paymentMethods = List();
  _verticalDivider() => Container(
    padding: EdgeInsets.all(2.0),
  );

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 5.0),
  );


  int radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(
          builder: (context) => Checkout(),
        )),
      ),),

      body:       ListView.builder(

          itemCount: paymentMethods.length+1,
          itemBuilder: (BuildContext context, int index)=>
              (index==2)?
           Padding(padding: EdgeInsets.only(top: 200),child: orderDetailCard())

          : paymentMethodsRadioButton(index)

      ),
        bottomNavigationBar: paymentButton(context),
      );
  }
  paymentMethodsRadioButton(int index) {

          return RadioListTile<String>(
            title: Text(paymentMethods[index].name),
            value: paymentMethods[index].name,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value;
              });
            },
            activeColor: Colors.green,
          );

  }

  Widget paymentButton(BuildContext context) {
    Container(
            padding: EdgeInsets.all(20),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.green,
              child: Text(
                _character == ''
                    ? 'SELECT PAYMENT METHOD'
                    : _character == 'COD'
                    ? 'PAY ON DELIVERY'
                    : 'CONTINUE ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              onPressed: () {

              }
            ),
          );

  }

 Widget orderDetailCard() {
    return Container(
      margin: EdgeInsets.all(10),

    );
  }
}

class PaymentMethod {
  final String name;

  PaymentMethod({
    this.name,
  });
}
