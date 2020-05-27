import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homebox/Shared/newModel.dart';
import 'package:homebox/screens/splash.dart';

class Items extends StatefulWidget {
  final int index;
  final String DocID;
  Items({Key key, @required this.index, @required this.DocID})
      : super(key: key);
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Items",
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
                    .document(vendorId)
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
                    .document(vendorId)
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
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 3.5),
                            ),
                            itemCount: snapshot
                                .data
                                .data["items"]["category"][widget.index]
                                    ["subcategory"][selectedIndex]["items"]
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  newsettingModalBottomSheet(context,  snapshot.data.data["items"]
                                                      ["category"][widget.index]
                                                  ["subcategory"][selectedIndex]
                                              ["items"][index]["quantity"].toString(),  snapshot.data.data["items"]
                                                      ["category"][widget.index]
                                                  ["subcategory"][selectedIndex]
                                              ["items"][index]["price"].toString(),  snapshot.data.data["items"]
                                                      ["category"][widget.index]
                                                  ["subcategory"][selectedIndex]
                                              ["items"][index]["name"].toString());
                                },
                                child: Container(
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
                                    ],
                                  )),
                              );
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
