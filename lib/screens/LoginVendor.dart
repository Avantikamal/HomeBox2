import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homebox/VendorPart/bottomBar.dart';
import 'package:homebox/screens/Login.dart';
import '../VendorPart/bottomBar.dart';

TextEditingController _codeController = new TextEditingController();
TextEditingController _phoneController = new TextEditingController();
TextEditingController _name = new TextEditingController();
String city;
TextEditingController _keyController = new TextEditingController();
String key = "homebox";

class LoginVendor extends StatefulWidget {
  @override
  _LoginVendor createState() => _LoginVendor();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _LoginVendor extends State<LoginVendor> {
  List<String> _locations = ['Vadodra', 'Bhavnagar', 'Bharuch','Ajmer','Nasirabad'];
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFF61ce70),
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
                      padding: EdgeInsets.only(top: 40),
                      height: MediaQuery.of(context).size.height / 2,
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
                                        TextFormField(
                                          controller: _name,
                                          decoration: InputDecoration(
                                              icon: new Icon(Icons.text_fields),
                                              border: InputBorder.none,
                                              hintText: 'Enter Your Name'),
                                        ),
                                        SizedBox(height: 10),
                                        TextField(
                                          maxLength: 10,
                                          keyboardType: TextInputType.number,
                                          controller: _phoneController,
                                          decoration: InputDecoration(
                                              icon: new Icon(
                                                  Icons.format_list_numbered),
                                              border: InputBorder.none,
                                              hintText: 'Enter Your Number'),
                                        ),
                                        SizedBox(height: 10),
                                        TextField(
                                          maxLength: 10,
                                          controller: _keyController,
                                          decoration: InputDecoration(
                                              icon: new Icon(Icons.vpn_key),
                                              border: InputBorder.none,
                                              hintText: 'Enter Your Unique ID'),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: DropdownButton(
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
                                        SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: () {
                                            if (_phoneController.text.length ==
                                                    10 ||
                                                _name.text != null &&
                                                    _name.text != "" ||
                                                key == _keyController.text) {
                                              _auth.verifyPhoneNumber(
                                                  phoneNumber: "+91" +
                                                      _phoneController.text,
                                                  timeout:
                                                      Duration(seconds: 60),
                                                  verificationCompleted:
                                                      (authCredential) =>
                                                          verificationCompleted(
                                                              authCredential, context),
                                                  verificationFailed: (authException) =>
                                                      verificationFailed(
                                                          authException, context),
                                                  codeSent: (verificationId, [code]) =>
                                                      smsSent(verificationId,
                                                          [code], context),
                                                  codeAutoRetrievalTimeout:
                                                      (verificationId) =>
                                                          print("Enter OTP manually"));
                                            } else {
                                              showDialog(
                                                  context: (context),
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          "One or More options are missing Or Key is invalid"),
                                                      actions: <Widget>[
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("OK"),
                                                        )
                                                      ],
                                                    );
                                                  });
                                            }

                                            // Navigator.pushAndRemoveUntil(
                                            //     context,
                                            //     CupertinoPageRoute(
                                            //         builder: (context) =>
                                            //             BottomBarVendor()),
                                            //     (route) => false);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
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
                                        ),
                                        SizedBox(height: 20),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          Login()),
                                                  (route) => false);
                                            },
                                            child: Text("Login as User"))
                                      ],
                                    ),
                                  )))))),
            ],
          )),
    );
  }
}

verificationCompleted(AuthCredential authCredential, BuildContext context) {
  _auth.signInWithCredential(authCredential).then((value) {
    Firestore.instance.collection("Vendor").document(value.user.uid).setData(
        {"name": _name.text, "city": city, "type": "vendor"}).whenComplete(() {
      UserUpdateInfo update = new UserUpdateInfo();
      update.displayName = "vendor";

      value.user.updateProfile(update);
      value.user.reload();
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => BottomBarVendor()),
          (route) => false);
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
                        //Implement login functionality.
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
                              .collection("Vendor")
                              .document(value.user.uid)
                              .setData({
                            "name": _name.text,
                            "city": city,
                            "type": "vendor"
                          }).whenComplete(() {
                            UserUpdateInfo update = new UserUpdateInfo();
                            update.displayName = "vendor";

                            value.user.updateProfile(update);
                            value.user.reload();
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => BottomBarVendor()),
                                (route) => false);
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