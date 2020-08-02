import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homebox/integration/auto_login.dart';
import 'package:homebox/screens/AboutUs.dart';
import 'package:homebox/screens/Login_screen.dart';
import 'package:homebox/screens/editProfile.dart';
import 'package:homebox/screens/refer_earn.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  String token;
  Profile({this.token});
  @override
  _ProfileState createState() => _ProfileState(token);
}

class _ProfileState extends State<Profile> {
  String token;
  _ProfileState(this.token);
  Future<void> logout() async {
    // Gets the operation status from the API
    String url = 'http://homebox-backend.herokuapp.com/api/logout/';
    http.Response response = await http.get(url,headers: {"Authorization":"Token $token"});
    // Map converts the raw JSON into a usable object
    Map mymap = json.decode(response.body);
    if (mymap['success'] != null) {
      if (mymap["success"]) {
        TokenService().removeLogInToken(token);
        print('You have been successfully logged out!');

      }
    }
    else{
      print(mymap["detail"]);
    }
  }

  @override
  void initState() {
    super.initState();
    token = widget.token;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, bottom: 15.0, top: 40.0),
            child: Column(children: <Widget>[
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()));
                      },
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.red, fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  FlatButton(
                      onPressed: null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Invite Friends',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Refer_earn()));
                            },
                          )
                        ],
                      )),
                  Divider(),
                  FlatButton(
                      onPressed: null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'About Us',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => aboutUs()));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ))
                        ],
                      )),
                  Divider(),
                  FlatButton(
                      onPressed: null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                await logout();
                                return Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                      return LoginScreen();
                                    }));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ))
                        ],
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
