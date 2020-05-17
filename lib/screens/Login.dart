import 'package:flutter/material.dart';

import 'Dashboard.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blueGrey,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\tLogin",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height / 1.7,
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage(
                                                'assets/logo/user.png')),
                                        SizedBox(height: 50),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              icon: new Icon(Icons.text_fields),
                                              border: InputBorder.none,
                                              hintText: 'Enter Your Name'),
                                        ),
                                        SizedBox(height: 10),
                                        TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              icon: new Icon(
                                                  Icons.format_list_numbered),
                                              border: InputBorder.none,
                                              hintText: 'Enter Your Number'),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Dashboard()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              height: 40,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Center(
                                                  child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ))),
                                        )
                                      ],
                                    ),
                                  ))))))
            ],
          )),
    );
  }
}
