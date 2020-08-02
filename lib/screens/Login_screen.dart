import 'package:flutter/material.dart';
import 'package:homebox/screens/dashboard.dart';
import 'package:homebox/integration/Integration.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:homebox/screens/otp_screen.dart';

import 'package:sms_autofill/sms_autofill.dart';

String phoneNumber;
String phoneIsoCode;


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {


  void onPhoneNumberChange(String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }


  @override
  void initState() {
    super.initState();

  }

  Widget HomePage() {
    return  Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        image: DecorationImage(
//          colorFilter: new ColorFilter.mode(
//              Colors.black.withOpacity(0.1), BlendMode.dstATop),
          image: AssetImage('assets/images/homePage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
//          Container(
//            padding: EdgeInsets.only(top: 250.0),
//            child: Center(
//              child: Icon(
//                Icons.headset_mic,
//                color: Colors.white,
//                size: 40.0,
//              ),
//            ),
//          ),
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Hi,Welcome!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                  ),
                ),
//                Text(
//                  "App",
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 20.0,
//                      fontWeight: FontWeight.bold),
//                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 390.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.redAccent,
                    onPressed: () => gotoSignup(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
//            alignment: Alignment.center,
//            child: new Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new FlatButton(
//                    shape: new RoundedRectangleBorder(
//                        borderRadius: new BorderRadius.circular(30.0)),
//                    color: Colors.white,
//                    onPressed: () => gotoLogin(),
//                    child: new Container(
//                      padding: const EdgeInsets.symmetric(
//                        vertical: 20.0,
//                        horizontal: 20.0,
//                      ),
//                      child: new Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          new Expanded(
//                            child: Text(
//                              "LOGIN",
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  color: Colors.redAccent,
//                                  fontWeight: FontWeight.bold),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
        ],
      ),
    );
  }

  Widget LoginPage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
//        image: DecorationImage(
//          colorFilter: new ColorFilter.mode(
//              Colors.black.withOpacity(0.05), BlendMode.dstATop),
//          image: AssetImage('assets/images/mountains.jpg'),
//          fit: BoxFit.cover,
//        ),
      ),
      child: SingleChildScrollView(
        child: new Column(
          children: <Widget>[

          Container(
            padding: EdgeInsets.only(top:100.0),
            child: Text('Welcome Back',
              style: TextStyle(
                fontSize: 20
              ),
              textAlign: TextAlign.left,

            ),
          ),
          Container(
            child: Text('Please login to your account',style: TextStyle(
                fontWeight: FontWeight.w600,

            ),
              textAlign: TextAlign.left,),
          ),

            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0,top: 70.0),
                    child: new Text(
                      "EMAIL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.redAccent,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextField(
                      obscureText: false,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'abc123@gmail.com',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 24.0,
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: new Text(
                      "PASSWORD",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.redAccent,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '*********',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 24.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: new FlatButton(
                    child: new Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Colors.redAccent,
                      onPressed: ()=>

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>   Dashboard(),
                          )),

                       child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(border: Border.all(width: 0.25)),
                    ),
                  ),
                  Text(
                    "OR CONNECT WITH",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(border: Border.all(width: 0.25)),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      margin: EdgeInsets.only(right: 8.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              color: Color(0Xff3B5998),
                              onPressed: () => {},
                              child: new Container(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: new FlatButton(
                                        onPressed: ()=>{},
                                        padding: EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                        ),
                                        child: new Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Icon(
                                              const IconData(0xea90,
                                                  fontFamily: 'icomoon'),
                                              color: Colors.white,
                                              size: 15.0,
                                            ),
                                            Text(
                                              "FACEBOOK",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      margin: EdgeInsets.only(left: 8.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              color: Color(0Xffdb3236),
                              onPressed: () => {},
                              child: new Container(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: new FlatButton(
                                        onPressed: ()=>{},
                                        padding: EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                        ),
                                        child: new Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Icon(
                                              const IconData(0xea88,
                                                  fontFamily: 'icomoon'),
                                              color: Colors.white,
                                              size: 15.0,
                                            ),
                                            Text(
                                              "GOOGLE",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget SignupPage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
//        image: DecorationImage(
//          colorFilter: new ColorFilter.mode(
//              Colors.black.withOpacity(0.05), BlendMode.dstATop),
//          image: AssetImage('assets/images/mountains.jpg'),
//          fit: BoxFit.cover,
//        ),
      ),
      child: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:100.0),
              child: Text('Create Account',
                style: TextStyle(
                    fontSize: 20
                ),
                textAlign: TextAlign.left,

              ),
            ),
            Container(
              child: Text('Sign Up to get started!',style: TextStyle(
                fontWeight: FontWeight.w600,

              ),
                textAlign: TextAlign.left,),
            ),

            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Padding(
                    padding: const EdgeInsets.only(left: 40.0,top: 70.0),
                    child: new Text(
                      "Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.redAccent,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: InternationalPhoneInput(
                        decoration: InputDecoration.collapsed(hintText: 'Phone Number'),
                        onPhoneNumberChange: onPhoneNumberChange,
                        initialPhoneNumber: phoneNumber,
                        initialSelection: phoneIsoCode,
                        enabledCountries: [ '+91']
                    ),
//                    child: TextField(
//                      obscureText: false,
//                      textAlign: TextAlign.left,
//                      decoration: InputDecoration(
//                        border: InputBorder.none,
//                        hintText: 'Phone Number',
//                        hintStyle: TextStyle(color: Colors.grey),
//                      ),
//                    ),
                  ),
                ],
              ),
            ),

//            new Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new Padding(
//                    padding: const EdgeInsets.only(left: 40.0),
//                    child: new Text(
//                      "PASSWORD",
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        color: Colors.redAccent,
//                        fontSize: 15.0,
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//            new Container(
//              width: MediaQuery.of(context).size.width,
//              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
//              alignment: Alignment.center,
//              decoration: BoxDecoration(
//                border: Border(
//                  bottom: BorderSide(
//                      color: Colors.redAccent,
//                      width: 0.5,
//                      style: BorderStyle.solid),
//                ),
//              ),
//              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//              child: new Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  new Expanded(
//                    child: TextField(
//                      obscureText: true,
//                      textAlign: TextAlign.left,
//                      decoration: InputDecoration(
//                        border: InputBorder.none,
//                        hintText: '*********',
//                        hintStyle: TextStyle(color: Colors.grey),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),

//            new Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new Padding(
//                    padding: const EdgeInsets.only(left: 40.0),
//                    child: new Text(
//                      "CONFIRM PASSWORD",
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        color: Colors.redAccent,
//                        fontSize: 15.0,
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//            new Container(
//              width: MediaQuery.of(context).size.width,
//              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
//              alignment: Alignment.center,
//              decoration: BoxDecoration(
//                border: Border(
//                  bottom: BorderSide(
//                      color: Colors.redAccent,
//                      width: 0.5,
//                      style: BorderStyle.solid),
//                ),
//              ),
//              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//              child: new Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  new Expanded(
//                    child: TextField(
//                      obscureText: true,
//                      textAlign: TextAlign.left,
//                      decoration: InputDecoration(
//                        border: InputBorder.none,
//                        hintText: '*********',
//                        hintStyle: TextStyle(color: Colors.grey),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),

//            new Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.only(right: 20.0),
//                  child: new FlatButton(
//                    child: new Text(
//                      "Already have an account?",
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        color: Colors.redAccent,
//                        fontSize: 15.0,
//                      ),
//                      textAlign: TextAlign.end,
//                    ),
//                    onPressed: () => {},
//                  ),
//                ),
//              ],
//            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 35.0),
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Colors.redAccent,
                      onPressed: ()async {
                        await  Otpservice().otpGenerate("+91"+phoneNumber);//genrerate otp
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Otp(phoneNumber: "+91"+phoneNumber),
                        ));
                      },
                      child: new Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                                "SIGN UP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40,right: 40.0,top: 20.0,bottom: 10.0),
              child: Text('By tapping Sign up you'
                ' agree with our terms.Learn how we '
                'process your data in our Privacy Policy'
                ' and Cookies Policy.',textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black26
            ),)
              ,),

//            Container(
//
//              width: MediaQuery.of(context).size.width,
//              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
//              alignment: Alignment.center,
//              child: Row(
//                children: <Widget>[
//                  new Expanded(
//                    child: new Container(
//                      margin: EdgeInsets.all(8.0),
//                      decoration: BoxDecoration(border: Border.all(width: 0.25)),
//                    ),
//                  ),
//                  Text(
//                    "OR CONNECT WITH",
//                    style: TextStyle(
//                      color: Colors.grey,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                  new Expanded(
//                    child: new Container(
//                      margin: EdgeInsets.all(8.0),
//                      decoration: BoxDecoration(border: Border.all(width: 0.25)),
//                    ),
//                  ),
//                ],
//              ),
//            ),

//            Container(
//              width: MediaQuery.of(context).size.width,
//              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
//              child: new Row(
//                children: <Widget>[
//                  new Expanded(
//                    child: new Container(
//                      margin: EdgeInsets.only(right: 8.0),
//                      alignment: Alignment.center,
//                      child: new Row(
//                        children: <Widget>[
//                          new Expanded(
//                            child: new FlatButton(
//                              shape: new RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(30.0),
//                              ),
//                              color: Color(0Xff3B5998),
//                              onPressed: () => {},
//                              child: new Container(
//                                child: new Row(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: new FlatButton(
//                                        onPressed: ()=>{},
//                                        padding: EdgeInsets.only(
//                                          top: 20.0,
//                                          bottom: 20.0,
//                                        ),
//                                        child: new Row(
//                                          mainAxisAlignment:
//                                          MainAxisAlignment.spaceEvenly,
//                                          children: <Widget>[
//                                            Icon(
//                                              const IconData(0xea90,
//                                                  fontFamily: 'icomoon'),
//                                              color: Colors.white,
//                                              size: 15.0,
//                                            ),
//                                            Text(
//                                              "FACEBOOK",
//                                              textAlign: TextAlign.center,
//                                              style: TextStyle(
//                                                  color: Colors.white,
//                                                  fontWeight: FontWeight.bold),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  new Expanded(
//                    child: new Container(
//                      margin: EdgeInsets.only(left: 8.0),
//                      alignment: Alignment.center,
//                      child: new Row(
//                        children: <Widget>[
//                          new Expanded(
//                            child: new FlatButton(
//                              shape: new RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(30.0),
//                              ),
//                              color: Color(0Xffdb3236),
//                              onPressed: () => {},
//                              child: new Container(
//                                child: new Row(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    new Expanded(
//                                      child: new FlatButton(
//                                        onPressed: ()=>{},
//                                        padding: EdgeInsets.only(
//                                          top: 20.0,
//                                          bottom: 20.0,
//                                        ),
//                                        child: new Row(
//                                          mainAxisAlignment:
//                                          MainAxisAlignment.spaceEvenly,
//                                          children: <Widget>[
//                                            Icon(
//                                              const IconData(0xea88,
//                                                  fontFamily: 'icomoon'),
//                                              color: Colors.white,
//                                              size: 15.0,
//                                            ),
//                                            Text(
//                                              "GOOGLE",
//                                              textAlign: TextAlign.center,
//                                              style: TextStyle(
//                                                  color: Colors.white,
//                                                  fontWeight: FontWeight.bold),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            )


          ],
        ),
      ),
    );
  }

  gotoLogin() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  PageController _controller = new PageController(initialPage: 0, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
          height: MediaQuery.of(context).size.height,
//      child: new GestureDetector(
//        onHorizontalDragStart: _onHorizontalDragStart,
//        onHorizontalDragUpdate: _onHorizontalDragUpdate,
//        onHorizontalDragEnd: _onHorizontalDragEnd,
//        behavior: HitTestBehavior.translucent,
//        child: Stack(
//          children: <Widget>[
//            new FractionalTranslation(
//              translation: Offset(-1 - (scrollPercent / (1 / numCards)), 0.0),
//              child: SignupPage(),
//            ),
//            new FractionalTranslation(
//              translation: Offset(0 - (scrollPercent / (1 / numCards)), 0.0),
//              child: HomePage(),
//            ),
//            new FractionalTranslation(
//              translation: Offset(1 - (scrollPercent / (1 / numCards)), 0.0),
//              child: LoginPage(),
//            ),
//          ],
//        ),
//      ),
          child: PageView(
            controller: _controller,
            physics: new AlwaysScrollableScrollPhysics(),
            children: <Widget>[HomePage(), SignupPage()],
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}