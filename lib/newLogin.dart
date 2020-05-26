import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

TextEditingController _name = new TextEditingController();
TextEditingController _mobNo = new TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              Transform.rotate(
                angle: -16 * 3.14 / 180,
                child: Text(
                  "HomeBox",
                  style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: "Pacifico",
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              Text(
                "Login to Continue",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _mobNo,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Mobile No.",
                  ),
                ),
              ),
              // SizedBox(
              //   width: 200,
              //   height: 1.5,
              //   child: Container(
              //     color: Colors.black45,
              //   ),
              // ),
              SizedBox(
                height: 40.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 40.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset.fromDirection(7.5, 5.0),
                            blurRadius: 5.0,
                            color: Colors.black38)
                      ],
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: "Julius"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
