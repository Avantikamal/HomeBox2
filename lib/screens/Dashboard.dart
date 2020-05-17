import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedindex = 0;
  var _switchVal;
  List<IconData> _icons = [
    FontAwesomeIcons.ccDinersClub,
    FontAwesomeIcons.coffee,
    FontAwesomeIcons.iceCream,
    Icons.fastfood
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedindex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: _selectedindex == index
                ? Theme.of(context).accentColor
                : Colors.white54,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: _selectedindex == index ? Colors.white : Colors.black38,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _icons
                          .asMap()
                          .entries
                          .map((MapEntry map) => _buildIcon(map.key))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
              child: Container(
                // ignore: unrelated_type_equality_checks
                height: 250.0,
                child: Row(
                  children: <Widget>[
                    Card(
                      color: ThemeMode.dark == true
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorDark,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          //container for data
                          Positioned(
                            bottom: 10.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: 250.0,
                              width: 200.0,
                              child: Column(
                                children: <Widget>[
                                  //name and price of the product
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Bread',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Text('₹40.0'),
                                      ),
                                    ],
                                  ),
                                  //Vendors who deliver
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(''),
                                      ],
                                    ),
                                  ),
                                  //Add to Box Button
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Center(
                                          child: SizedBox(
                                            height: 40,
                                            width: 110,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: MaterialButton(
                                                color: Colors.blueGrey,
                                                child: Text(
                                                  'ADD TO BOX',
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins'),
                                                ),
                                                elevation: 8.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                padding: EdgeInsets.all(10.0),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //image of the product
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Image.network(
                                'https://pngimage.net/wp-content/uploads/2018/05/bread-loaf-png.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: ThemeMode.dark == true
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorDark,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          //container for data
                          Positioned(
                            bottom: 10.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: 250.0,
                              width: 200.0,
                              child: Column(
                                children: <Widget>[
                                  //name and price of the product
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Bread',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Text('₹40.0'),
                                      ),
                                    ],
                                  ),
                                  //Vendors who deliver
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(''),
                                      ],
                                    ),
                                  ),
                                  //Add to Box Button
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Center(
                                          child: SizedBox(
                                            height: 40,
                                            width: 110,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: MaterialButton(
                                                color: Colors.blueGrey,
                                                child: Text(
                                                  'ADD TO BOX',
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins'),
                                                ),
                                                elevation: 8.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                padding: EdgeInsets.all(10.0),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //image of the product
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Image.network(
                                'https://pngimage.net/wp-content/uploads/2018/05/bread-loaf-png.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
              child: Container(
                height: 250.0,
                child: Row(
                  children: <Widget>[
                    Card(
                      // ignore: unrelated_type_equality_checks
                      color: ThemeMode.dark == true
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorDark,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          //container for data
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 250.0,
                            width: 200.0,
                            child: Column(
                              children: <Widget>[
                                //Add to Box Button
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0, vertical: 10.0),
                                  child: SizedBox(
                                    height: 40,
                                    width: 110,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: MaterialButton(
                                        color: Colors.blueGrey,
                                        child: Text(
                                          'ADD TO BOX',
                                          style:
                                              TextStyle(fontFamily: 'Poppins'),
                                        ),
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        padding: EdgeInsets.all(10.0),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                                //name and price of the product
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Amul Taza Toned Milk',
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text('₹20.0'),
                                    ),
                                  ],
                                ),
                                //Vendors who deliver
                                Text(''),
                              ],
                            ),
                          ),
                          //image of the product
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Image.network(
                                'https://pngimage.net/wp-content/uploads/2018/05/amul-milk-png-3.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
