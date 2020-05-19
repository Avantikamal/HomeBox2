import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:homebox/screens/allItems.dart';

class AllCatagory extends StatefulWidget {
  @override
  _AllCatagory createState() => _AllCatagory();
}

bool _selectIndex = false,
    _selectIndex2 = false,
    _selectIndex3 = false,
    _selectIndex4 = false,
    _selectIndex5 = false,
    _selectIndex6 = false;

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
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: AssetImage(photos[photoIndex]),
                                fit: BoxFit.cover)),
                        height: 250.0,
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: _previousImage,
                      backgroundColor: Colors.grey.shade100,
                      child: Center(
                          child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                    ),
                    SizedBox(width: 10.0),
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: _nextImage,
                      backgroundColor: Colors.grey.shade100,
                      child: Center(
                          child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 1, right: 5),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      allItems(context, "Beverages")));
                          if (_selectIndex == false) {
                            setState(() {
                              _selectIndex = true;
                            });
                          } else {
                            setState(() {
                              _selectIndex = false;
                            });
                          }
                        },
                        child: _selectIndex == false
                            ? Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Image.asset(
                                            'assets/images/coffee.png')),
                                    Text(
                                      "Beverages",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              ))
                            : Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(-5, -5),
                                          blurRadius: 10),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(10, 10),
                                          blurRadius: 10)
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Image.asset(
                                            'assets/images/coffee.png')),
                                    Text(
                                      "Beverages",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              )))),
                Padding(
                    padding: EdgeInsets.only(top: 40, right: 10, left: 5),
                    child: GestureDetector(
                      
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      allItems(context, "Groceries")));
                          if (_selectIndex2 == false) {
                            setState(() {
                              _selectIndex2 = true;
                            });
                          } else {
                            setState(() {
                              _selectIndex2 = false;
                            });
                          }
                        },
                        child: _selectIndex2 == false
                            ? Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Image.asset(
                                            'assets/images/safola.png')
                                        // Image.network('https://i1.wp.com/localiteshop.com/wp-content/uploads/2019/11/GROCERY_AND_STAPLES-600x315-1.png?w=980&ssl=1')
                                        ),
                                    Text(
                                      "Groceries",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              ))
                            : Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(-5, -5),
                                          blurRadius: 10),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(10, 10),
                                          blurRadius: 10)
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Image.asset(
                                            'assets/images/safola.png')),
                                    Text(
                                      "Groceries",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              ))))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 40, left: 1, right: 5),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      allItems(context, "Fruits")));
                          if (_selectIndex3 == false) {
                            setState(() {
                              _selectIndex3 = true;
                            });
                          } else {
                            setState(() {
                              _selectIndex3 = false;
                            });
                          }
                        },
                        child: _selectIndex3 == false
                            ? Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10,top:10),
                                        child: Image.asset(
                                            'assets/images/fruits.jpg')),
                                    SizedBox(height: 10),
                                    Text(
                                      "Fruits",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              ))
                            : Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(-5, -5),
                                          blurRadius: 10),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(10, 10),
                                          blurRadius: 10)
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10,top:10),
                                        child: Image.asset(
                                            'assets/images/fruits.jpg')),
                                    SizedBox(height: 10),
                                    Text(
                                      "Fruits",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              )))),
                Padding(
                    padding: EdgeInsets.only(top: 40, right: 10, left: 5),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      allItems(context, "Noodles")));
                          if (_selectIndex4 == false) {
                            setState(() {
                              _selectIndex4 = true;
                            });
                          } else {
                            setState(() {
                              _selectIndex4 = false;
                            });
                          }
                        },
                        child: _selectIndex4 == false
                            ? Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 0),
                                        child: Image.asset(
                                            'assets/images/maggie.png')),
                                    Text(
                                      "Noodles",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              ))
                            : Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(-5, -5),
                                          blurRadius: 10),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(10, 10),
                                          blurRadius: 10)
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20, top: 0),
                                        child: Image.asset(
                                            'assets/images/maggie.png')),
                                    Text(
                                      "Noodles",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              ))))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding:
                        EdgeInsets.only(top: 40, left: 1, right: 5, bottom: 20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      allItems(context, "Snacks")));
                          if (_selectIndex5 == false) {
                            setState(() {
                              _selectIndex5 = true;
                            });
                          } else {
                            setState(() {
                              _selectIndex5 = false;
                            });
                          }
                        },
                        child: _selectIndex5 == false
                            ? Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 5,
                                            top: 7),
                                        child: Image.asset(
                                            'assets/images/oreo.png')),
                                    Text(
                                      "Snacks",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              ))
                            : Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(-5, -5),
                                          blurRadius: 10),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(10, 10),
                                          blurRadius: 10)
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 5,
                                            top: 7),
                                        child: Image.asset(
                                            'assets/images/oreo.png')),
                                    Text(
                                      "Snacks",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              )))),
                Padding(
                    padding: EdgeInsets.only(
                        top: 40, right: 10, left: 5, bottom: 20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      allItems(context, "Dairy")));
                          if (_selectIndex6 == false) {
                            setState(() {
                              _selectIndex6 = true;
                            });
                          } else {
                            setState(() {
                              _selectIndex6 = false;
                            });
                          }
                        },
                        child: _selectIndex6 == false
                            ? Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Image.asset(
                                            'assets/images/amul.png')),
                                    Text(
                                      "Dairy",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              ))
                            : Center(
                                child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.3,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(-5, -5),
                                          blurRadius: 10),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(10, 10),
                                          blurRadius: 10)
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Image.asset(
                                            'assets/images/amul.png')),
                                    Text(
                                      "Dairy",
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 20),
                                    )
                                  ],
                                ),
                              ))))
              ],
            )
          ],
        ));
  }
}
