import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homebox/Shared/Modal.dart';
import 'package:homebox/screens/AddBoxPage.dart';
import 'AllCatagory.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedindex = 0;
  var _switchVal;
  // List<IconData> _icons = [
  //   FontAwesomeIcons.ccDinersClub,
  //   FontAwesomeIcons.coffee,
  //   FontAwesomeIcons.iceCream,
  //   FontAwesomeIcons.oilCan,
  //   FontAwesomeIcons.brush,
  //   Icons.fastfood
  // ];

  // Widget _buildIcon(int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         _selectedindex = index;
  //       });
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Container(
  //         height: 60.0,
  //         width: 60.0,
  //         decoration: BoxDecoration(
  //           boxShadow: [
  //             BoxShadow(
  //                 color: Colors.grey, offset: Offset(5, 5), blurRadius: 5),
  //             BoxShadow(
  //                 color: Colors.white, offset: Offset(-5, -5), blurRadius: 5)
  //           ],
  //           color: _selectedindex == index
  //               ? Theme.of(context).accentColor
  //               : Colors.grey.shade100,
  //           borderRadius: BorderRadius.circular(30.0),
  //         ),
  //         child: Icon(
  //           _icons[index],
  //           size: 25.0,
  //           color: _selectedindex == index ? Colors.white : Colors.black38,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                    MaterialPageRoute(builder: (context) => AllCatagory()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddBox()));
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
                    MaterialPageRoute(builder: (context) => AllCatagory()));
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
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            // Padding(
            //   padding: EdgeInsets.only(left: 10),
            //   child: Stack(
            //     children: <Widget>[
            //       Text(
            //         "All Catagories",
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            //       ),
            //       GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => AllCatagory()));
            //           },
            //           child: Padding(
            //               padding: EdgeInsets.only(right: 10),
            //               child: Align(
            //                   alignment: Alignment.topRight,
            //                   child: Text(
            //                     "View All >>",
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 15,
            //                         color: Color(0xff61ce70)),
            //                   ))))
            //     ],
            //   ),
            // ),
            // SizedBox(height: 10),
            // Container(
            //   height: 80.0,
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         child: ListView(
            //           scrollDirection: Axis.horizontal,
            //           children: _icons
            //               .asMap()
            //               .entries
            //               .map((MapEntry map) => _buildIcon(map.key))
            //               .toList(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Frequently Used Products:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      fontFamily: 'Poppins'),
                )),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10),
              child: Container(
                // ignore: unrelated_type_equality_checks
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            // height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width / 2,
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
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width / 2,
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
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Top Rated Products:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Poppins'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10),
              child: Container(
                // ignore: unrelated_type_equality_checks
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width / 2,
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
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width / 2,
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
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Organic Farms & Vegeies:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      fontFamily: 'Poppins'),
                )),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10),
              child: Container(
                // ignore: unrelated_type_equality_checks
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            // height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width / 2,
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
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width / 2,
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
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
