import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homebox/Shared/newProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebox/screens/splash.dart';

int counter = 0;
void newsettingModalBottomSheet(BuildContext context, quantity, price, name) {
  showModalBottomSheet(
      elevation: 8.0,
      // barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: (MediaQuery.of(context).size.height / 3),
            child: new Wrap(
              children: <Widget>[
                newdetailsContainer(context, '$quantity', '$price', '$name'),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            counter = counter - 1;
                          });
                        },
                        child: Icon(Icons.remove, size: 40)),
                    SizedBox(width: 10),
                    Text(
                      counter.toString(),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            counter = counter + 1;
                          });
                        },
                        child: Icon(
                          Icons.add,
                          size: 40,
                        )),
                  ],
                )),
                SizedBox(height: 50),
                Container(
                  child: ListTile(
                    leading: new Icon(Icons.add_shopping_cart),
                    title: Text(
                      'Add To Box',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    onTap: () {
                      List<dynamic> cart = [];
                      cart.add({
                        "productName": name,
                        "price": price,
                        "quantity": quantity,
                        "number Of Items": counter
                      });
                      Firestore.instance
                          .collection("users")
                          .document(userID)
                          .updateData({"carty": FieldValue.arrayUnion(cart)});
                      Fluttertoast.showToast(
                          msg: "Items Added to Cart",
                          toastLength: Toast.LENGTH_SHORT);
                    },
                  ),
                  color: Colors.pink,
                ),
              ],
            ),
          );
        });
      });
}
