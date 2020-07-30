import 'package:flutter/material.dart';
import 'package:homebox/models/order.dart';
import 'package:homebox/models/line_item.dart';
import 'package:homebox/screens/payment.dart';
import 'package:homebox/screens/update_address.dart';
class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  Order order;
  List<LineItem> lineItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Review Order'),
      ),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverList(delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 35.0),
                  child: Text(
                    'Shipping Address',
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w200,
                        fontSize: 16.0),
                  ),
                ),
                order.shipAddress==null?
                Container(
                  padding: EdgeInsets.only(top: 15),
                  height: 40,
                  margin: EdgeInsets.only(left: 40, right: 120),
                  child: FlatButton(
                    color: Colors.white,
                    child: Text(
                     'ADD NEW ADDRESS',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
//                    onPressed: () {
//                      MaterialPageRoute payment = MaterialPageRoute(
//                          builder: (context) => UpdateAddress(
//                              model.order.shipAddress, true));
//                      Navigator.push(context, payment);
//                    },
                  ),
                ):
                Container(),
                SizedBox(
                  height: 35,
                ),
                order.shipAddress!=null?
    Container(
    width: MediaQuery.of(context).size.width,
    child: Card(
    margin: EdgeInsets.all(15),
    child: Container(
    margin: EdgeInsets.all(10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Flexible(
    child: Text(
    order.shipAddress.firstName +
    ' ' +
    order.shipAddress.lastName,
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    overflow: TextOverflow.ellipsis,
    ),
    ),
    FlatButton(
    onPressed: () {
//    MaterialPageRoute payment = MaterialPageRoute(
//    builder: (context) => UpdateAddress(
//    model.order.shipAddress, true));
//    Navigator.push(context, payment);
    },
    child: Text(
    'EDIT',
    style: TextStyle(
    color: Colors.green,
    fontSize: 15.0,
    fontWeight: FontWeight.bold),
    )),
    ],
    ),
    textFieldContainer(order.shipAddress.address1),
    textFieldContainer(order.shipAddress.address2),
    textFieldContainer(order.shipAddress.city +
    ' - ' +
    order.shipAddress.pincode),
    textFieldContainer(order.shipAddress.stateName),
    textFieldContainer('Mobile: ' + ' - ' + order.shipAddress.mobile),
    ],
    ),
    ),
    ),

    ):
        Container(),
    SizedBox(
    height: 25,
    ),
    Padding(
    padding: const EdgeInsets.only(
    left: 15.0, top: 15.0, bottom: 10.0),
    child: Text(
    'Order Summary',
    style: TextStyle(
    color: Colors.grey.shade600,
    fontSize: 16.0,
    fontWeight: FontWeight.w100),
    ),
    ),
    cat_items(lineItem),


            ]  )
              )
            ],

          ),
          Positioned(bottom:0,
              child: BottomAppBar(
                  child: Container(
                      height: 90,
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Order Total: ',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  '${order.displayTotal}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                )
                              ],
                            )),
                        Container(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 5.0),
                          width: MediaQuery.of(context).size.width,
                          child:  FlatButton(
                            disabledColor: Colors.grey.shade200,
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            color: Colors.red,
                            child: Text(
                              'PLACE ORDER',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            onPressed: order.shipAddress != null
                                ? () {
                              MaterialPageRoute address = MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateAddress(shipAddress: order.shipAddress,order: true,));

                              order.shipAddress != null
                                  ? Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()))
                                  : Navigator.push(context, address);
                            }
                                : null,
                          ),
                        )
                      ]))))
        ],

      ),
    );
  }
    Widget textFieldContainer(String text) {
    return Container(
    child: Text(
    text,
    style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
    ),
    );
    }
  Widget cat_items( lineItems) {
    return ListView.builder(
      itemCount: lineItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(4.0),
              child: Container(
                color: Colors.white,
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(14),
                              padding: EdgeInsets.all(10),
                              height: 80,
                              width: 80,
                              color: Colors.white,
                         decoration: BoxDecoration(
                           image: DecorationImage(image: AssetImage(lineItem[index].image),fit: BoxFit.cover)
                         ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10.0, top: 10.0),
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text:
                                              '${lineItem[index].title
                                                  .split(' ')[0]} ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text: lineItem[index].title
                                                  .substring(
                                                  lineItems[index]
                                                      .variant
                                                      .name
                                                      .split(' ')[0]
                                                      .length +
                                                      1,
                                                  lineItem[index].title
                                                      .length),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Qty: ${lineItem[index].quantity
                                            .toString()}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 14),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 24.0),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          lineItem[index].total,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey.shade700,
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
