import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddItems extends StatefulWidget {
  @override
  _AddItems createState() => _AddItems();
}

TextEditingController itemName = new TextEditingController();
TextEditingController itemPrice = new TextEditingController();
TextEditingController quantity = new TextEditingController();

class _AddItems extends State<AddItems> {
  bool _selectIndex = false,
      _selectIndex2 = false,
      _selectIndex3 = false,
      _selectIndex4 = false,
      _selectIndex5 = false,
      _selectIndex6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 5.0,
          centerTitle: true,
          title: Text(
            'HomeBox',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection("Vendor")
                .document("Vendor Catagory")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> data = snapshot.data.data["items"]["category"];
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    SubCategory(context, data, index)));
                      },
                      child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(data[index]["name"]),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}

Widget SubCategory(BuildContext context, List<dynamic> data, int index) {
  return Scaffold(
    body: ListView.builder(
      itemCount: data[index]["subcategory"].length,
      itemBuilder: (context, int i) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    height: 300,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: itemName,
                          decoration: InputDecoration(hintText: "Enter Name"),
                        ),
                        TextField(
                          controller: itemPrice,
                          decoration: InputDecoration(hintText: "Enter Price"),
                        ),
                        TextField(
                          controller: quantity,
                          decoration:
                              InputDecoration(hintText: "Enter Quantity"),
                        ),
                        RaisedButton(
                          onPressed: () {
                            data[index]["subcategory"][i]["items"].add({
                              "name": itemName.text,
                              "price": itemPrice.text,
                              "quantity": quantity.text
                            });
                            Firestore.instance
                                .collection("Vendor")
                                .document("Vendor Catagory")
                                .updateData({
                              "items": {"category": data}
                            }).whenComplete(() {
                              itemName.clear();
                              itemPrice.clear();
                              quantity.clear();
                              Navigator.pop(context);
                            });
                          },
                          child: Text("Submit"),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.green,
            ),
            child: Center(
              child: Text(data[index]["subcategory"][i]["name"]),
            ),
          ),
        );
      },
    ),
  );
}
