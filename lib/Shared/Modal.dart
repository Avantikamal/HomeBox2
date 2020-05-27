import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:homebox/Shared/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

void settingModalBottomSheet(BuildContext context, price, address) {
  showModalBottomSheet(
      elevation: 8.0,
      // barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: (MediaQuery.of(context).size.height),
          child: new Wrap(
            children: <Widget>[
              detailsContainer(context, '$price', '$address'),
              Container(
                child: ListTile(
                  leading: new Icon(Icons.add_shopping_cart),
                  title: Text(
                    'Place Order',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onTap: () async {
                    DocumentSnapshot map = await Firestore.instance
                        .collection("users")
                        .document('727K9wIkrkr1n883RT3Y')
                        .get();
                    List<dynamic> orders = map.data['carty'];

                    Firestore.instance
                        .collection("users")
                        .document('727K9wIkrkr1n883RT3Y')
                        .updateData({"orders": FieldValue.arrayUnion(orders)});
                    Firestore.instance
                        .collection("category")
                        .document('example')
                        .updateData(
                            {"customerOrder": FieldValue.arrayUnion(orders)});
                    Fluttertoast.showToast(
                        msg: "Order Placed", toastLength: Toast.LENGTH_SHORT);
                  },
                ),
                color: Color(0xff61ce70),
              ),
            ],
          ),
        );
      });
}
