import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homebox/screens/AddBoxPage.dart';
import 'package:homebox/screens/itemsList.dart';

class AllCatagory extends StatefulWidget {
  String docID;
  AllCatagory({Key key, @required this.docID}) : super(key: key);
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
              .document(widget.docID)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
                                                  DocID: widget.docID,
                                                )));
                                  },
                                  child: Center(
                                      child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(20),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        Center(
                                            child: Text(va[index]['name'],
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)))
                                      ],
                                    ),
                                  ))))
                        ],
                      );
                    });
            }
          }),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            SafeArea(
                child: Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg'),
                      fit: BoxFit.fill)),
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 10),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Welcome",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))),
            )),
            SizedBox(height: 30),
            ListTile(
              title: Text(
                'Our Vendors',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllCatagory(docID: 'TrH35yGujGhwnaeWGhKz6SNPGhp1')));
              },
            ),
            ListTile(
              title: Text(
                'My Box',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddBox()));
              },
            ),
            ListTile(
              title: Text(
                'Organic Farms',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllCatagory(docID: 'TrH35yGujGhwnaeWGhKz6SNPGhp1')));
              },
            ),

            // ListTile(
            //   title: Text(
            //     'Deals Of The Day',
            //     style: TextStyle(
            //       fontFamily: 'Poppins',
            //     ),
            //   ),
            // ),
            ListTile(
              title: Text(
                'All Categories',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllCatagory(docID: 'TrH35yGujGhwnaeWGhKz6SNPGhp1')));
              },
            ),
            Divider(
              thickness: 1.0,
            ),
            ListTile(
              title: Text(
                'LogOut',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
