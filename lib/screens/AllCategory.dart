import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebox/screens/itemsList.dart';
import 'package:homebox/screens/splash.dart';

class AllCatagory extends StatefulWidget {
  @override
  _AllCatagory createState() => _AllCatagory();
}

class _AllCatagory extends State<AllCatagory> {
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
                .document(vendorId)
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
                                              builder: (context) => Items(
                                                    index: index,
                                                    DocID: vendorId,
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
