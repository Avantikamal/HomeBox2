import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:homebox/Shared/Product.dart' as pdt;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homebox/screens/splash.dart';

void settingModalBottomSheet(BuildContext context, price,index) {
  showModalBottomSheet(
      elevation: 8.0,
      // barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: (MediaQuery.of(context).size.height),
          child: new Wrap(
            children: <Widget>[
              pdt.detailsContainer(context, '$price','$index'),
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
                        .document(userID)
                        .get();
                    List<dynamic> orders = map.data['carty'];
                    List<dynamic> orders2 = map.data['carty'];
                    orders2.add({"address":pdt.address.text});
                    

                    Firestore.instance
                        .collection("users")
                        .document(userID)
                        .updateData({"orders": FieldValue.arrayUnion(orders)});
                    Firestore.instance
                        .collection("vendor")
                        .document(vendorId)
                        .updateData(
                            {"customerOrder": FieldValue.arrayUnion(orders2)});
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
