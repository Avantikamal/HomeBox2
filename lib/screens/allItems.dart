import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Scaffold allItems(BuildContext context, name) {
  print(name);
  return Scaffold(
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
              .collection('Vendor')
              .document('HomeBox Catagory')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<dynamic> va = name['subcategory'];
            print(va);
            if (snapshot.hasError) return Text('${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text("Loading...");
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
                                            builder: (context) =>
                                                allCater(context, va[index])));
                                  },
                                  child: Center(
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                          child: Center(
                                            child: Text(
                                              va[index]['name'].toString(),
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )))))
                        ],
                      );
                    });
            }
          }));
}

Widget allCater(BuildContext context, ind) {
  return Scaffold(
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
              .collection('Vendor')
              .document('HomeBox Catagory')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data!=null) {
              List<dynamic> va = ind['items'];

              // if (snapshot.hasError) return Text('${snapshot.error}');

              print(va);
              return ListView.builder(
                  itemCount: va.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (va[index] != null) {
                      return Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(20),
                              child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             allCater(context, va[index])));
                                  },
                                  child: Center(
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              7,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                va[index]['name'].toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "Price :  " +
                                                          va[index]['price']
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "Quantity :  " +
                                                          va[index]['quantity']
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  )),
                                            ],
                                          )))))
                        ],
                      );
                    } else {
                      return Center(
                        child: Text("data"),
                      );
                    }
                  });
            } else {
              return Center(child: Text("Empty"));
            }
          }));
}
