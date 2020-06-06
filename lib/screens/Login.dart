import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController _phoneController = new TextEditingController();
TextEditingController _name = new TextEditingController();
String city;
FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  List<String> _locations = [
    'Vadodra',
    'Bhavnagar',
    'Bharuch',
    'Ajmer',
    'Nasirabad'
  ];
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/organic-food.png'),
                fit: BoxFit.cover,
                color: Colors.black87,
                colorBlendMode: BlendMode.darken,
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "\tLogin",
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontFamily: 'Poppins',
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.0, -1.0),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.0, -1.0),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(1.0, 1.0),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.0, 1.0),
                              color: Colors.black),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, left: 40.0, right: 40.0, bottom: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                            icon: new Icon(Icons.text_fields),
                            border: InputBorder.none,
                            hintText: 'Enter Your Name'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: TextField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                        decoration: InputDecoration(
                            icon: new Icon(Icons.format_list_numbered),
                            border: InputBorder.none,
                            hintText: 'Enter Your Number'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: DropdownButton(
                        icon: Icon(Icons.location_city),
                        hint: Text(
                            'Please choose a location'), // Not necessary for Option 1
                        value: _selectedLocation,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                            city = newValue;
                          });
                        },
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (_phoneController.text.length == 10 ||
                      _name.text != null && _name.text != "") {
                    _auth.verifyPhoneNumber(
                        phoneNumber: "+91" + _phoneController.text,
                        timeout: Duration(seconds: 60),
                        verificationCompleted: (authCredential) =>
                            verificationCompleted(authCredential, context),
                        verificationFailed: (authException) =>
                            verificationFailed(authException, context),
                        codeSent: (verificationId, [code]) =>
                            smsSent(verificationId, [code], context),
                        codeAutoRetrievalTimeout: (verificationId) =>
                            print("Enter OTP manually"));
                  } else {
                    showDialog(
                        context: (context),
                        builder: (context) {
                          return AlertDialog(
                            content: Text("One or More options are missing"),
                            actions: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              )
                            ],
                          );
                        });
                  }
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 40,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Center(
                            child: Text(
                          "Submit",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

verificationCompleted(AuthCredential authCredential, BuildContext context) {
  _auth.signInWithCredential(authCredential).then((value) {
    Firestore.instance.collection("users").document(value.user.uid).setData({
      "name": _name.text,
      "city": city,
      "type": "user",
      "vendor": "",
    }).whenComplete(() {
      /*Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => VendorList()),
          (route) => false);*/
    });
  });
}

verificationFailed(AuthException authException, BuildContext context) {
  print(authException.message);
}

smsSent(String verificationId, List<int> code, BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => otpPage(context, verificationId)));
}

codeAutoRetrieval() {}

Widget otpPage(BuildContext context, String verificationId) {
  TextEditingController otp = new TextEditingController();
  return Scaffold(
    body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Color(0xFF61ce70)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 300, 30, 0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(children: <Widget>[
                Center(
                  child: Text(
                    "Please wait or Enter OTP manually",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, fontFamily: "Poppins"),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  style: TextStyle(color: Color.fromRGBO(38, 50, 56, .50)),
                  controller: otp,
                  decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(38, 50, 56, 0.30),
                      fontSize: 15.0,
                      fontFamily: "Poppins",
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 49.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () async {
                        // Implement login functionality.
                        // Fluttertoast.showToast(
                        //     msg: "Please Wait", timeInSecForIosWeb: 3);
                        final AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId,
                                smsCode: otp.text);
                        FirebaseAuth.instance
                            .signInWithCredential(credential)
                            .then((value) {
                          Firestore.instance
                              .collection("users")
                              .document(value.user.uid)
                              .setData({
                            "name": _name.text,
                            "city": city,
                            "type": "user",
                            "vendor": "",
                          }).whenComplete(() {
                            /*Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => VendorList()),
                                (route) => false);*/
                          });
                          // Firestore.instance
                          //     .collection("users")
                          //     .document(value.user.uid)
                          //     .setData(
                          //         {"name": _name.text, "mobile": mobNo.text});
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     CupertinoPageRoute(
                          //         builder: (context) => ExplorePage()),
                          //     (route) => false);
                        });
                      },
                      minWidth: 220.0,
                      height: 50.0,
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ]),
            ),
          ),
        ),
      ],
    ),
  );
}
