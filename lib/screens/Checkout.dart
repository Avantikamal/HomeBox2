import 'package:flutter/material.dart';
import 'package:homebox/screens/MyCart.dart';
import 'package:homebox/screens/payment.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:homebox/models/order.dart';

import 'address.dart';

class Checkout extends StatefulWidget {

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String amt;

  bool checkboxValueA = true;

  _verticalDivider() => Container(
    padding: EdgeInsets.all(2.0),
  );

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
     backgroundColor: Colors.white,
        appBar: AppBar(
          elevation:0.0,
          backgroundColor: Colors.white,

          leading: IconButton(icon: Icon(Icons.arrow_back_ios,
          color: Colors.black,), onPressed:  ()=>
              Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyCart(),
          )),),

        ),
//
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 3.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                selectedAddressSection(),
standardDelivery(),
checkoutItem(),
priceSection()
//            Container(
//                    color: Colors.grey.shade200,
//                    height: 50.0,
//                    padding: EdgeInsets.all(8.0),
//                    width: double.infinity,
//                    child: Text("Delivery Address",
//                    style: TextStyle(
//                      fontSize: 20.0
//                    ),)
//                ),
//            Container(
//              height: 200.0,
//              width: 350.0,
//              margin: EdgeInsets.only(top: 15.0),
//
//              child: Card(
//                elevation: 3.0,
//                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    new Column(
//                      children: <Widget>[
//                        new Container(
//                          margin: EdgeInsets.only(
//                              left: 12.0,
//                              top: 20.0,
//                              right: 0.0,
//                              bottom: 5.0),
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              new Text(
//                                'House no',
//                                style: TextStyle(
//                                  color: Colors.black87,
//                                  fontSize: 15.0,
//                                  fontWeight: FontWeight.bold,
//                                  letterSpacing: 0.5,
//                                ),
//                              ),
//                              _verticalDivider(),
//                              new Text(
//                                'Street',
//                                style: TextStyle(
//                                    color: Colors.black45,
//                                    fontSize: 13.0,
//                                    letterSpacing: 0.5),
//                              ),
//                              _verticalDivider(),
//                              new Text(
//                                'City',
//                                style: TextStyle(
//                                    color: Colors.black45,
//                                    fontSize: 13.0,
//                                    letterSpacing: 0.5),
//                              ),
//                              _verticalDivider(),
//                              new Text(
//                                'Pin',
//                                style: TextStyle(
//                                    color: Colors.black45,
//                                    fontSize: 13.0,
//                                    letterSpacing: 0.5),
//                              ),
//                              new Container(
//                                margin: EdgeInsets.only(
//                                    left: 00.0,
//                                    top: 05.0,
//                                    right: 0.0,
//                                    bottom: 5.0),
//                                child: Row(
//                                  crossAxisAlignment:
//                                  CrossAxisAlignment.center,
//                                  mainAxisAlignment:
//                                  MainAxisAlignment.start,
//                                  children: <Widget>[
//                                    new Text(
//                                      'Delivery Address',
//                                      style: TextStyle(
//                                        fontSize: 15.0,
//                                        color: Colors.black26,
//                                      ),
//                                    ),
//                                    _verticalD(),
//                                    new Checkbox(
//                                      value: checkboxValueA,
//                                      onChanged: (bool value) {
//                                        setState(() {
//                                          checkboxValueA = value;
//                                        });
//                                      },
//                                    ),
//                                  ],
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//            ),

//            Container(
//              margin: EdgeInsets.all(7.0),
//              child: Card(
//                elevation: 1.0,
//                child: Row(
//                  children: <Widget>[
//                    new IconButton(icon: Icon(Icons.location_on),
//                        onPressed: ()=>Navigator.push(context, MaterialPageRoute(
//                          builder: (context) => Address(),
//                        )),),
//                    _verticalD(),
//                    new Text(
//                      'Add New Address',
//                      style: TextStyle(fontSize: 15.0, color: Colors.black87),
//                    )
//                  ],
//                ),
//              ),
//            ),
,
//            Container(
//                color: Colors.grey.shade200,
//                height: 50.0,
//                padding: EdgeInsets.all(8.0),
//                width: double.infinity,
//                child: Text("Order Summary",
//                  style: TextStyle(
//                      fontSize: 20.0
//                  ),)
//            ),
//           SizedBox(height: 15.0,),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text("Subtotal"),
//                   Text("₹120"),
//                  ],
//                ),
//                SizedBox(height: 10.0,),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text("Delivery fee"),
//                    Text("₹0"),
//                  ],
//                ),
//                SizedBox(height: 10.0,),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text("Total",style: TextStyle(
//                      fontSize: 20.0
//                    ),),
//                    Text("₹120",style: TextStyle(
//                        fontSize: 20.0
//                    ), ),
//                  ],
//                ),

SizedBox(height: 2.0,),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  width: MediaQuery.of(context).size.width-18.0,
                  child: FlatButton(
                    
                    onPressed: ()=>
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Payment(),
                      )),
                    child: Text("Payment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ),

              ],
            ),
          )
        ),
      ),
    );
  }


  selectedAddressSection() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        color: Colors.red.shade50,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Person Name ",
                    style: TextStyle(fontSize: 14),
                  ),
                  Container(
                    padding:
                    EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Text(
                      "HOME",
                      style: TextStyle(
                          color: Colors.indigoAccent.shade200, fontSize: 8),
                    ),
                  )
                ],
              ),
              createAddressText(
                  "House NO., Street, Locality", 16),
              createAddressText("Mumbai - pincode", 6),
              createAddressText("Maharashtra", 6),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Mobile : ",
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: "02222673745",
                      style: TextStyle(color: Colors.black, fontSize: 12)),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),
              addressAction()
            ],
          ),
        ),
      ),
    );
  }

  createAddressText(String strAddress, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Text(
        strAddress,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
      ),
    );
  }

  addressAction() {
    return Container(
      child: Row(
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "Edit / Change",
              style: TextStyle(fontSize: 12, color: Colors.indigo.shade700),
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          Spacer(
            flex: 3,
          ),
          Container(
            height: 20,
            width: 1,
            color: Colors.grey,
          ),
          Spacer(
            flex: 3,
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Add New Address",
                style: TextStyle
                    (fontSize: 12, color: Colors.indigo.shade700)),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
  standardDelivery() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border:
          Border.all(color: Colors.tealAccent.withOpacity(0.4), width: 1),
          color: Colors.tealAccent.withOpacity(0.2)),
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (isChecked) {},
            activeColor: Colors.tealAccent.shade400,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Standard Delivery",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Get it by 20 jul - 27 jul | Free Delivery",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }



  checkoutItem() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return checkoutListItem();
            },
            itemCount: 3,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
  checkoutListItem() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage(
                "assets/images/beverages.jpg",
              ),
              width: 35,
              height: 45,
              fit: BoxFit.fitHeight,
            ),
            decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          ),
          SizedBox(
            width: 8,
          ),
Text('Estimated Delivery: 21 Jul 2020 ',style: TextStyle(fontWeight: FontWeight.w500),)
//          RichText(
//            text: TextSpan(children: [
//              TextSpan(
//                  text: "Estimated Delivery : ",
//                  style: TextStyle(fontSize: 22)),
//              TextSpan(
//                  text: "21 Jul 2019 ",
//                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
//            ]),
//          )
        ],
      ),
    );
  }
  priceSection() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 4,
              ),
              Text(
                "PRICE DETAILS",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 8,
              ),
              createPriceItem("Total MRP", getFormattedCurrency(5197),
                  Colors.grey.shade700),
              createPriceItem("Bag discount", getFormattedCurrency(3280),
                  Colors.teal.shade300),
              createPriceItem(
                  "Tax", getFormattedCurrency(96), Colors.grey.shade700),
              createPriceItem("Order Total", getFormattedCurrency(2013),
                  Colors.grey.shade700),
              createPriceItem(
                  "Delievery Charges", "FREE", Colors.teal.shade300),
              SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    getFormattedCurrency(2013),
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String getFormattedCurrency(double amount) {
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(amount: amount);
    fmf.settings.symbol = "₹";
    fmf.settings.thousandSeparator = ",";
    fmf.settings.decimalSeparator = ".";
    fmf.settings.symbolAndNumberSeparator = " ";
    return fmf.output.symbolOnLeft;
  }

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
          Text(
            value,
            style: TextStyle(color: color, fontSize: 12),
          )
        ],
      ),
    );
  }

}
