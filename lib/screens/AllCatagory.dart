import 'package:flutter/material.dart';
import 'package:homebox/screens/allItems.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllCatagory extends StatefulWidget {
  @override
  _AllCatagory createState() => _AllCatagory();
}

class _AllCatagory extends State<AllCatagory> {
  int photoIndex = 0;

  List<String> photos = [
    'assets/images/grocery.jpg',
    'assets/images/noodles.jpg',
    'assets/images/snacks.jpg'
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

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
                .collection('Vendor')
                .document('Vendor Catagory')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              List<dynamic> va = snapshot.data.data['items']['category'];
              
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
                                              builder: (context) => allItems(
                                                  context,
                                                  va[index])));
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
                                      child: Row(
                                        children: <Widget>[
                                          // Padding(
                                          //     padding: EdgeInsets.only(left: 0),
                                          //     child:
                                          //      Image.network(va[index]['image'].toString())
                                          //         ),
                                          Text(
                                            va[index]['name'].toString(),
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 25),
                                          )
                                        ],
                                      ),
                                    ))))
                          ],
                        );
                      });
              }
            })

        // ListView(
        //   children: <Widget>[
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         SizedBox(height: 10),
        //         Center(
        //           child: Stack(
        //             children: <Widget>[
        //               Container(
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(15.0),
        //                     image: DecorationImage(
        //                         image: AssetImage(photos[photoIndex]),
        //                         fit: BoxFit.cover)),
        //                 height: 250.0,
        //                 width: MediaQuery.of(context).size.width,
        //               )
        //             ],
        //           ),
        //         ),
        //         SizedBox(height: 10),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             FloatingActionButton(
        //               heroTag: null,
        //               onPressed: _previousImage,
        //               backgroundColor: Colors.grey.shade100,
        //               child: Center(
        //                   child: Icon(
        //                 Icons.arrow_back_ios,
        //                 color: Colors.black,
        //               )),
        //             ),
        //             SizedBox(width: 10.0),
        //             FloatingActionButton(
        //               heroTag: null,
        //               onPressed: _nextImage,
        //               backgroundColor: Colors.grey.shade100,
        //               child: Center(
        //                   child: Icon(
        //                 Icons.arrow_forward_ios,
        //                 color: Colors.black,
        //               )),
        //             ),
        //           ],
        //         )
        //       ],
        //     ),

        //   ],
        // )
        );
  }
}
