import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homebox/VendorPart/MyItemList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebox/screens/itemsList.dart';
import 'package:homebox/screens/splash.dart';

class MyItems extends StatefulWidget {
  @override
  _MyItems createState() => _MyItems();
}

class _MyItems extends State<MyItems> {
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
        body: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection('vendor')
                .document(userID)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              List<dynamic> va = snapshot.data.data['items']['category'];

              if (snapshot.hasError) return Text('${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: SpinKitChasingDots(color: Colors.black));
                default:
                  return ListView.builder(
                      itemCount: va.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(20),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyItemList(
                                                    index: index,
                                                  )));
                                    },
                                    child: Center(
                                        child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(10, 10),
                                                blurRadius: 10),
                                            BoxShadow(
                                                color: Colors.white,
                                                offset: Offset(-5, -5),
                                                blurRadius: 10)
                                          ]),
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(va[index]
                                                        ['image']
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Center(
                                              child: Text(va[index]['name'],
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)))
                                        ],
                                      ),
                                    ))))
                          ],
                        );
                      });
              }
            }));
  }
}

Widget productList(BuildContext context, List<dynamic> data, int index, int i) {
  return Scaffold(
    body: ListView.builder(
      itemCount: data[index]["subcategory"][i]["items"].length,
      itemBuilder: (context, int j) {
        return GestureDetector(
          onTap: () {
            List<dynamic> temp = [];
            for (int k = 0;
                k < data[index]["subcategory"][i]["items"].length;
                k++) {
              if (k == j) {
                continue;
              } else {
                temp.add(data[index]["subcategory"][i]["items"][j]);
              }
            }
            data[index]["subcategory"][i]["items"] = temp;
            Firestore.instance
                .collection("vendor")
                .document(userID)
                .updateData({
              "items": {"category": data}
            });
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
              child: Text(data[index]["subcategory"][i]["items"][j]["name"]),
            ),
          ),
        );
      },
    ),
  );
}
