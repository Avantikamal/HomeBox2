import 'package:flutter/material.dart';
import 'package:homebox/screens/AboutUs.dart';
import 'package:homebox/screens/editProfile.dart';
import 'package:homebox/screens/refer_earn.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
    appBar: AppBar(
        elevation: 0.0,
      centerTitle: true,
        title: Text('Profile',
          style:  TextStyle(
          color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold

        ),),
        backgroundColor: Colors.white,
      ),
  body: Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 15.0,top: 40.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
            ),
            Card(
            child: Column(
              children: <Widget>[
                Center(child: Text('Person Name')),
                Center(child: Text('email')),
                Center(child: Text('Mobile Number')),

                Divider(),
                FlatButton(
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage())); },
                  child: Text('Edit Profile',style:
                  TextStyle(color: Colors.red,
                  fontSize: 16.0),),
                )
              ],
            ),
          ),]
        ),
      ),
      SizedBox(height: 3.0,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: <Widget>[
              FlatButton(onPressed: null, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Invite Friends',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,

                  ),),
                  IconButton(icon: Icon(Icons.arrow_forward_ios,
                  color: Colors.black,), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Refer_earn()));
                  },)
                ],
              )),
              Divider(),
              FlatButton(onPressed: null, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('About Us', style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),),
                  IconButton( onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> aboutUs()));},
                      icon: Icon(Icons.arrow_forward_ios,color: Colors.black,))
                ],
              )),
              Divider(),
              FlatButton(onPressed: null, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Logout',style: TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    ),),
                  IconButton(icon: Icon(Icons.arrow_forward_ios,color: Colors.black,)
                  ) ],
              )),

            ],
          ),
        ),
      )
    ],
  ),
);
  }
}
//  String username = 'Person_Name ';
//  String mobilenumber = '+91423482477';
//  String eid = 'person_name@gmail.com';
//  bool checkboxValueA = true;
//  bool checkboxValueB = false;
//  bool checkboxValueC = false;
//
//  _verticalDivider() => Container(
//    padding: EdgeInsets.all(2.0),
//  );
//
//  _verticalD() => Container(
//    margin: EdgeInsets.only(left: 7.0, right: 0.0, top: 0.0, bottom: 0.0),
//  );
//
//  List<ListProfileSection> listSection = new List();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    createListItem();
//  }
//
//  void createListItem() {
//    listSection.add(createSection(
//        "Invite Friends",
//        "images/ic_invite_friends.png",
//        Colors.indigo.shade800,
//        Refer_earn()));
//    listSection.add(createSection("About Us", "images/ic_about_us.png",
//        Colors.black.withOpacity(0.8), aboutUs()));
//    listSection.add(createSection(
//        "Logout", "images/ic_logout.png", Colors.red.withOpacity(0.7), null));
//  }
//
//  createSection(String title, String icon, Color color, Widget widget) {
//    return ListProfileSection(title: title,color: color,widget: widget);
//  }
//  @override
//  Widget build(BuildContext context) {
//
//
//    Icon ofericon = new Icon(
//      Icons.edit,
//      color: Colors.black38,
//    );
//    Icon keyloch = new Icon(
//      Icons.vpn_key,
//      color: Colors.black38,
//    );
//    Icon clear = new Icon(
//      Icons.history,
//      color: Colors.black38,
//    );
//    Icon logout = new Icon(
//      Icons.do_not_disturb_on,
//      color: Colors.black38,
//    );
//
//    Icon menu = new Icon(
//      Icons.more_vert,
//      color: Colors.black38,
//    );
//
//    return Scaffold(
//
//      appBar: AppBar(
//        elevation: 0.0,centerTitle: true,
//        title: Text('Profile',
//          style:  TextStyle(
//          color: Colors.black,
//            fontSize: 25.0,
//            fontWeight: FontWeight.bold
//
//        ),),
//        backgroundColor: Colors.white,
//      ),
//body:
////      body: new Container(
////          child: SingleChildScrollView(
////              child: new Column(
////               // mainAxisAlignment: MainAxisAlignment.center,
////                textDirection: TextDirection.ltr,
////                children: <Widget>[
////                  new Container(
////                    margin: EdgeInsets.all(7.0),
////                    alignment: Alignment.topCenter,
////                    height: 280.0,
////                    child: Column(
////                      mainAxisAlignment: MainAxisAlignment.center,
////                      children: <Widget>[
////                        new Container(
////                            alignment: Alignment.topCenter,
////                            child: Container(
////                              width: 100.0,
////                              height: 100.0,
////                              margin: const EdgeInsets.all(10.0),
////                              // padding: const EdgeInsets.all(3.0),
////                              child: ClipOval(
////                                child: Image.network(
////                                    'https://www.fakenamegenerator.com/images/sil-female.png'),
////                              ),
////                            )),
////
////                        new FlatButton(
////                          onPressed: null,
////                          child: Text(
////                            'Change',
////                            style:
////                            TextStyle(fontSize: 13.0, color: Colors.blueAccent),
////                          ),
////                          shape: RoundedRectangleBorder(
////                              borderRadius: new BorderRadius.circular(30.0),
////                              side: BorderSide(color: Colors.blueAccent)),
////                        ),
////
////                        new Row(
////                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                          crossAxisAlignment: CrossAxisAlignment.center,
////                          children: <Widget>[
////                            new Container(
////                              margin: EdgeInsets.only(
////                                  left: 90, top: 20.0, right: 5.0, bottom: 5.0),
////                              child: Column(
////                                crossAxisAlignment: CrossAxisAlignment.center,
////                                mainAxisAlignment: MainAxisAlignment.center  ,
////                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                                children: <Widget>[
////                                  new Text(
////                                    username,
////                                    style: TextStyle(
////                                      color: Colors.black87,
////                                      fontSize: 15.0,
////                                      fontWeight: FontWeight.bold,
////                                      letterSpacing: 0.5,
////                                    ),
////                                  ),
////                                  _verticalDivider(),
////                                  new Text(
////                                    mobilenumber,
////                                    style: TextStyle(
////                                        color: Colors.black45,
////                                        fontSize: 13.0,
////                                        fontWeight: FontWeight.bold,
////                                        letterSpacing: 0.5),
////                                  ),
////                                  _verticalDivider(),
////                                  new Text(
////                                    eid,
////                                    style: TextStyle(
////                                        color: Colors.black45,
////                                        fontSize: 13.0,
////                                        fontWeight: FontWeight.bold,
////                                        letterSpacing: 0.5),
////                                  )
////                                ],
////                              ),
////                            ),
//////                            new Container(
//////                              alignment: Alignment.centerLeft,
//////                              child: IconButton(
//////                                  icon: ofericon,
//////                                  color: Colors.blueAccent,
//////                                  onPressed: null),
//////                            )
////                          ],
////                        ),
////                        // VerticalDivider(),
////                      ],
////                    ),
////                  ),
////                  new Container(
////                    margin:
////                    EdgeInsets.only(left: 10.0, top: 20.0, right: 5.0, bottom: 5.0),
////                    child: new Text(
////                      'Addresses',
////                      style: TextStyle(
////                          color: Colors.black87,
////                          fontWeight: FontWeight.bold,
////                          fontSize: 18.0),
////                    ),
////                  ),
////                  new Container(
////                      height: 175.0,
////                      child: ListView(
////                        scrollDirection: Axis.horizontal,
////                        children: <Widget>[
////                          Container(
////                            height: 280.0,
////                            width: 255.0,
////                            margin: EdgeInsets.all(7.0),
////                            child: Card(
////                              elevation: 3.0,
////                              child: Row(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////
////                                children: <Widget>[
////                                  new Column(
////
////
////                                    children: <Widget>[
////                                      new Container(
////                                        margin: EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
////                                        child: Column(
////                                          crossAxisAlignment: CrossAxisAlignment.start,
////
////                                          children: <Widget>[
////                                            new Text(
////                                              'House',
////                                              style: TextStyle(
////                                                color: Colors.black87,
////                                                fontSize: 15.0,
////                                                fontWeight: FontWeight.bold,
////                                                letterSpacing: 0.5,
////                                              ),
////                                            ),
////                                            _verticalDivider(),
////                                            new Text(
////                                              'Street',
////                                              style: TextStyle(
////                                                  color: Colors.black45,
////                                                  fontSize: 13.0,
////                                                  letterSpacing: 0.5),
////                                            ),
////                                            _verticalDivider(),
////                                            new Text(
////                                              'City',
////                                              style: TextStyle(
////                                                  color: Colors.black45,
////                                                  fontSize: 13.0,
////                                                  letterSpacing: 0.5),
////                                            ),
////                                            _verticalDivider(),
////                                            new Text(
////                                              ' Pin',
////                                              style: TextStyle(
////                                                  color: Colors.black45,
////                                                  fontSize: 13.0,
////                                                  letterSpacing: 0.5),
////                                            ),
////
////                                            new Container(
////                                             // margin: EdgeInsets.only(left: 00.0,top: 05.0,right: 0.0,bottom: 1.0),
////                                              child: Row(
////                                                crossAxisAlignment: CrossAxisAlignment.center,
////                                                mainAxisAlignment: MainAxisAlignment.start,
////                                                children: <Widget>[
////                                                  new Text(
////                                                    'Delivery Address',
////                                                    style: TextStyle(
////                                                      fontSize: 15.0,
////                                                      color: Colors.black26,
////                                                    ),
////
////                                                  ),
////                                                  _verticalD(),
////
////
////                                                  new Checkbox(
////                                                    value: checkboxValueA,
////                                                    onChanged: (bool value) {
////                                                      setState(() {
////                                                        checkboxValueA = value;
////                                                      });
////                                                    },
////                                                  ),
////                                                ],
////                                              ),
////
////                                            )
////
////                                          ],
////                                        ),
////                                      ),
////
////                                    ],
////                                  ),
////                                  new Container(
////                                    alignment: Alignment.topLeft,
////                                    child: IconButton(
////                                        icon: menu,
////                                        color: Colors.black38,
////                                        onPressed: null),
////                                  )
////                                ],
////                              ),
////                            ),
////                          ),
////                          Container(
////                            height: 280.0,
////                            width: 255.0,
////                            margin: EdgeInsets.all(7.0),
////                            child: Card(
////                              elevation: 3.0,
////                              child: Row(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////
////                                children: <Widget>[
////                                  new Column(
////
////
////                                    children: <Widget>[
////                                      new Container(
////                                        margin:
////                                        EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
////                                        child: Column(
////                                          crossAxisAlignment: CrossAxisAlignment.start,
////
////                                          children: <Widget>[
////                                            new Text(
////                                              'House',
////                                              style: TextStyle(
////                                                color: Colors.black87,
////                                                fontSize: 15.0,
////                                                fontWeight: FontWeight.bold,
////                                                letterSpacing: 0.5,
////                                              ),
////                                            ),
////                                            _verticalDivider(),
////                                            new Text(
////                                              ' Street',
////                                              style: TextStyle(
////                                                  color: Colors.black45,
////                                                  fontSize: 13.0,
////                                                  letterSpacing: 0.5),
////                                            ),
////                                            _verticalDivider(),
////                                            new Text(
////                                              'City',
////                                              style: TextStyle(
////                                                  color: Colors.black45,
////                                                  fontSize: 13.0,
////                                                  letterSpacing: 0.5),
////                                            ),
////                                            _verticalDivider(),
////                                            new Text(
////                                              ' Pin',
////                                              style: TextStyle(
////                                                  color: Colors.black45,
////                                                  fontSize: 13.0,
////                                                  letterSpacing: 0.5),
////                                            ),
////                                            new Container(
////                                            //  margin: EdgeInsets.only(left: 00.0,top: 05.0,right: 0.0,bottom: 5.0),
////                                              child: Row(
////                                                crossAxisAlignment: CrossAxisAlignment.center,
////                                                mainAxisAlignment: MainAxisAlignment.start,
////                                                children: <Widget>[
////                                                  new Text(
////                                                    'Delivery Address',
////                                                    style: TextStyle(
////                                                      fontSize: 15.0,
////                                                      color: Colors.black26,
////                                                    ),
////
////                                                  ),
////                                                  _verticalD(),
////
////                                                  new Checkbox(
////                                                    value: checkboxValueB,
////                                                    onChanged: (bool value) {
////                                                      setState(() {
////                                                        checkboxValueB = value;
////                                                      });
////                                                    },
////                                                  ),
////                                                ],
////                                              ),
////
////                                            )
////                                          ],
////                                        ),
////                                      ),
////
////                                    ],
////                                  ),
////                                  new Container(
////                                    alignment: Alignment.topLeft,
////                                    child: IconButton(
////                                        icon: menu,
////                                        color: Colors.black38,
////                                        onPressed: null),
////                                  )
////                                ],
////                              ),
////                            ),
////                          ),
////                          Container(
////                            height: 280.0,
////                            width: 255.0,
////                            margin: EdgeInsets.all(7.0),
////                            child: Card(
////                              elevation: 3.0,
////                              child: Row(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////
////                                children: <Widget>[
////                                  new Column(
////                                    children: <Widget>[
////                                      new Container(
////                                        margin:
////                                        EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
////                                        child: Column(
////                                          crossAxisAlignment: CrossAxisAlignment.start,
////
////                                          children: <Widget>[
////                                            new Text(
////                                              'House',
////                                              style: TextStyle(
////                                                color: Colors.black87,
////                                                fontSize: 15.0,
////                                                fontWeight: FontWeight.bold,
////                                                letterSpacing: 0.5,
////                                              ),
////                                            ),
////                                            _verticalDivider(),
////                                            new Text(
////                                              'Street',
////                                              style: TextStyle(
////                                                  color: Colors.black45,
////                                                  fontSize: 13.0,
////                                                  letterSpacing: 0.5),
////                                            ),
////                                            _verticalDivider(),
////                                            new Text(
////                                              'City',
////                                              style: TextStyle(
////                                                  color: Colors.black45,
////                                                  fontSize: 13.0,
////                                                  letterSpacing: 0.5),
////                                            ),
////                                            _verticalDivider(),
////                                            new Text(
////                                              'Pin',
////                                              style: TextStyle(
////                                                  color: Colors.black45,
////                                                  fontSize: 13.0,
////                                                  letterSpacing: 0.5),
////                                            ),
////                                            new Container(
////                                              //margin: EdgeInsets.only(left: 10.0, top: 20.0, right: 5.0, bottom: 5.0),
////                                              child: Row(
////                                                crossAxisAlignment: CrossAxisAlignment.center,
////                                                mainAxisAlignment: MainAxisAlignment.start,
////                                                children: <Widget>[
////                                                  new Text(
////                                                    'Delivery Address',
////                                                    style: TextStyle(
////                                                      fontSize: 15.0,
////                                                      color: Colors.black26,
////                                                    ),
////
////                                                  ),
////                                                  _verticalD(),
////
////                                                  new Checkbox(
////                                                    value: checkboxValueC,
////                                                    onChanged: (bool value) {
////                                                      setState(() {
////                                                        checkboxValueC = value;
////                                                      });
////                                                    },
////                                                  ),
////                                                ],
////                                              ),
////
////                                            )
////                                          ],
////                                        ),
////                                      ),
////
////                                    ],
////                                  ),
////                                  new Container(
////                                    alignment: Alignment.topLeft,
////                                    child: IconButton(
////                                        icon: menu,
////                                        color: Colors.black38,
////                                        onPressed: null),
////                                  )
////                                ],
////                              ),
////                            ),
////                          ),
////                        ],
////                      )
////                  ),
////                  new Container(
////                    margin: EdgeInsets.all(7.0),
////                    child: Card(
////                      elevation: 1.0,
////                      child: Row(
////                        children: <Widget>[
////                          new IconButton(icon: Icon(Icons.location_on), onPressed: null),
////                          _verticalD(),
////                          new Text(
////                            'Add New Address',
////                            style: TextStyle(fontSize: 15.0, color: Colors.black87),
////                          )
////                        ],
////                      ),
////                    ),
////                  ),
////                  new Container(
////                    margin: EdgeInsets.all(7.0),
////                    child: Card(
////                      elevation: 1.0,
////                      child: Row(
////                        children: <Widget>[
////                          new IconButton(icon: Icon(Icons.help), onPressed: null),
////                          _verticalD(),
////                          new Text(
////                            'Help',
////                            style: TextStyle(
////                              fontSize: 15.0,
////                              color: Colors.black87,
////                            ),
////                          )
////                        ],
////                      ),
////                    ),
////                  ),
////                  new Container(
////                    margin: EdgeInsets.all(7.0),
////                    child: Card(
////                      elevation: 1.0,
////                      child: Row(
////                        children: <Widget>[
////                          new IconButton(icon: logout, onPressed: null),
////                          _verticalD(),
////                          new Text(
////                            'Logout',
////                            style: TextStyle(
////                              fontSize: 15.0,
////                              color: Colors.redAccent,
////                            ),
////                          )
////                        ],
////                      ),
////                    ),
////                  )
////                ],
////              )
////          )
////      ),
//      ListView(
//        children: <Widget>[
//         SizedBox(height: 24),
//          buildHeader(),
//         SizedBox(height: 24),
//          buildListView()
//        ],
//      ),
//    );
//  }
//  Container buildHeader() {
//    return Container(
//      child: Row(
//        children: <Widget>[
//          SizedBox(width: 14),
//          Container(
//            width: 60,
//            margin: EdgeInsets.only(top: 8),
//            height: 60,
//            decoration: BoxDecoration(
//                image: DecorationImage(
//                    image: AssetImage("assets/images/ic_user_profile.png")),
//                borderRadius: BorderRadius.all(Radius.circular(24))),
//          ),
//         SizedBox(width: 10),
//          Expanded(
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      "Riya Patel",
//                      textAlign: TextAlign.start,
//                      style: TextStyle(color: Colors.blue.shade900, fontSize: 14),
//                    ),
//                    SizedBox(height: 2),
//                    Text(
//                      "riya@gmail.com",
//                      style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
//                    ),
//                  ],
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 12),
//                  child: Icon(
//                    Icons.keyboard_arrow_right,
//                    color: Colors.grey,
//                  ),
//                )
//              ],
//            ),
//            flex: 100,
//          )
//        ],
//      ),
//    );
//  }
//
//  ListView buildListView() {
//    return ListView.builder(
//      shrinkWrap: true,
//      primary: false,
//      itemBuilder: (context, index) {
//        return createListViewItem(listSection[index]);
//      },
//      itemCount: listSection.length,
//    );
//  }
//
//  createListViewItem(ListProfileSection listSection) {
//    return Builder(builder: (context) {
//      return InkWell(
//        splashColor: Colors.teal.shade200,
//        onTap: () {
//          if (listSection.widget != null) {
//            Navigator.of(context).push(new MaterialPageRoute(
//                builder: (context) => listSection.widget));
//          }
//        },
//        child: Container(
//          padding: EdgeInsets.only(top: 14, left: 24, right: 8, bottom: 14),
//          child: Row(
//            children: <Widget>[
//              Expanded(
//                child: Container(
//                  height: 30,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(24)),
//                      color: listSection.color),
//                  child: Image(
//                    image: AssetImage(),
//                    color: Colors.white,
//                  ),
//                ),
//                flex: 8,
//              ),
//              Expanded(
//                child: Container(
//                  margin: EdgeInsets.symmetric(horizontal: 8),
//                  child: Text(
//                    listSection.title,
//
//                  ),
//                ),
//                flex: 84,
//              ),
//              Expanded(
//                child: Container(
//                  child: Icon(
//                    Icons.keyboard_arrow_right,
//                    color: Colors.grey,
//                  ),
//                ),
//                flex: 8,
//              ),
//            ],
//          ),
//        ),
//      );
//    }
//    ); }
//
//}
//
//class ListProfileSection {
//  String title;
//  Icon icon;
//  Color color;
//  Widget widget;
//
//  ListProfileSection({this.title,this.icon,this.color,this.widget})
//

