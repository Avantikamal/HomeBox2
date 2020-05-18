import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homebox/screens/bottomNavBar.dart';

Future<bool> loginUser(String phone, BuildContext context) {
  FirebaseAuth _auth = FirebaseAuth.instance;

  _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();
        // AuthResult result = await _auth.signInWithCredential(credential);

        // FirebaseUser user = result.user;

        // if (user != null) {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => (HomeScreen())));
        // } else {
        //   print("Error");
        // }
      },
      verificationFailed: (AuthException exception) {
        print(exception);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Give the code?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  RaisedButton(
                    elevation: 10,
                    child: Text("Ok"),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {
                      final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        AuthResult result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomBar()));
                        } else {
                          print("Error");
                        }
                      
                    },
                  )
                ],
              );
            });
      },
      codeAutoRetrievalTimeout: null);
}

TextEditingController _codeController = new TextEditingController();
TextEditingController _phoneController = new TextEditingController();

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
                      padding: EdgeInsets.only(top: 40),
                      height: MediaQuery.of(context).size.height / 2.5,
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
                                          decoration: InputDecoration(
                                              icon: new Icon(Icons.text_fields),
                                              border: InputBorder.none,
                                              hintText: 'Enter Your Name'),
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              icon: new Icon(Icons.home),
                                              border: InputBorder.none,
                                              hintText: 'Enter Your Address'),
                                        ),
                                        SizedBox(height: 10),
                                        TextField(
                                          controller: _phoneController,
                                          decoration: InputDecoration(
                                              icon: new Icon(
                                                  Icons.format_list_numbered),
                                              border: InputBorder.none,
                                              hintText: 'Enter Your Number'),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            var phone = _phoneController.text;
                                            loginUser(phone, context);
                                            _phoneController.clear();
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
                                        )
                                      ],
                                    ),
                                  ))))))
            ],
          )),
    );
  }
}
