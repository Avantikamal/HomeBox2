import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homebox/screens/splash.dart';

class MyItemList extends StatefulWidget {
  final int index;
  MyItemList({Key key, @required this.index}) : super(key: key);
  @override
  _MyItemListState createState() => _MyItemListState();
}

class _MyItemListState extends State<MyItemList> {
  TextEditingController itemName = new TextEditingController();
  TextEditingController itemPrice = new TextEditingController();
  TextEditingController quantity = new TextEditingController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                        decoration: InputDecoration(hintText: "Enter Quantity"),
                      ),
                      RaisedButton(
                        onPressed: () async {
                          FirebaseUser user =
                              await FirebaseAuth.instance.currentUser();
                          DocumentSnapshot map = await Firestore.instance
                              .collection("vendor")
                              .document(user.uid)
                              .get();
                          List<dynamic> temp = map.data["items"]["category"];
                          temp[widget.index]["subcategory"][selectedIndex]
                                  ["items"]
                              .add({
                            "name": itemName.text,
                            "price": itemPrice.text,
                            "quantity": quantity.text
                          });
                          Firestore.instance
                              .collection("vendor")
                              .document(user.uid)
                              .updateData({
                            "items": {"category": temp}
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
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          "My Items",
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontFamily: "Poppins"),
        )),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              color: Colors.white,
              child: StreamBuilder<DocumentSnapshot>(
                stream: Firestore.instance
                    .collection("vendor")
                    .document(userID)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot
                          .data
                          .data["items"]["category"][widget.index]
                              ["subcategory"]
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Text(
                              snapshot.data.data["items"]["category"]
                                  [widget.index]["subcategory"][index]["name"],
                              style: TextStyle(
                                  fontSize:
                                      selectedIndex == index ? 25.0 : 20.0,
                                  color: selectedIndex == index
                                      ? Colors.green
                                      : Colors.black54,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  else{
                    return Center(child:Text("No Data"));
                  }
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 225,
              color: Colors.white,
              child: StreamBuilder<DocumentSnapshot>(
                stream: Firestore.instance
                    .collection("vendor")
                    .document(userID)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot
                                .data
                                .data["items"]["category"][widget.index]
                                    ["subcategory"][selectedIndex]["items"]
                                .length ==
                            0
                        ? Center(
                            child: Column(
                            children: <Widget>[
                              Image.asset(
                                "assets/images/empty.png",
                                width: MediaQuery.of(context).size.width - 100,
                              ),
                              Text(
                                "No Items Here",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.amber,
                                    fontFamily: "Poppins"),
                              )
                            ],
                          ))
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 3),
                            ),
                            itemCount: snapshot
                                .data
                                .data["items"]["category"][widget.index]
                                    ["subcategory"][selectedIndex]["items"]
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.amber),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Name: " +
                                          snapshot.data.data["items"]
                                                      ["category"][widget.index]
                                                  ["subcategory"][selectedIndex]
                                              ["items"][index]["name"]),
                                      Text("Price: " +
                                          snapshot.data.data["items"]
                                                      ["category"][widget.index]
                                                  ["subcategory"][selectedIndex]
                                              ["items"][index]["price"]),
                                      IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            return showDialog(
                                              context: (context),
                                              builder: (context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  content: Text(
                                                      "Do you really wat to Delete this item?"),
                                                  actions: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text("No"),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        List<dynamic> temp = [];
                                                        List<dynamic> data =
                                                            snapshot.data.data[
                                                                    "items"]
                                                                ["category"];
                                                        for (int k = 0;
                                                            k <
                                                                snapshot
                                                                    .data
                                                                    .data[
                                                                        "items"]
                                                                        [
                                                                        "category"]
                                                                        [widget
                                                                            .index]
                                                                        [
                                                                        "subcategory"]
                                                                        [
                                                                        selectedIndex]
                                                                        [
                                                                        "items"]
                                                                    .length;
                                                            k++) {
                                                          if (k == index) {
                                                            continue;
                                                          } else {
                                                            temp.add(snapshot
                                                                            .data
                                                                            .data["items"]
                                                                        ["category"]
                                                                    [widget
                                                                        .index]["subcategory"]
                                                                [
                                                                selectedIndex]["items"][k]);
                                                          }
                                                        }
                                                        data[widget.index][
                                                                    "subcategory"]
                                                                [selectedIndex]
                                                            ["items"] = temp;
                                                        Firestore.instance
                                                            .collection(
                                                                "vendor")
                                                            .document(userID)
                                                            .updateData({
                                                          "items": {
                                                            "category": data
                                                          }
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Text("Yes"),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            );
                                          })
                                    ],
                                  ));
                            });
                  }
                  else{
                    return Center(child:Text("No Data"));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
