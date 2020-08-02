import 'dart:async';

import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:homebox/integration/Integration.dart';
import 'package:homebox/integration/auto_login.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:homebox/screens/add_location.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Otp extends StatefulWidget {
  String phoneNumber;
  Otp({this.phoneNumber});
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String phoneNumber;
  String otp = "";
  void _listenOtp() async {
    await SmsAutoFill().listenForCode;
  }
  Duration timer=Duration(seconds: 29);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumber = widget.phoneNumber;
    _listenOtp();
  }

  Widget timerWidget(BuildContext context){
    return Countdown(

        duration:timer,
        onFinish: (){
          Otpservice().otpGenerate(phoneNumber);
          setState(() {
            timer=Duration(seconds: 29);
          });
        },
        builder: (BuildContext context, Duration d) {

          return Text(
            "Resend in " + d.inSeconds.toString(),
            style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w800),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'OTP Verification',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 90.0),
            child: Text(
              'Enter 6 digit number that sent to',
              style: TextStyle(color: Colors.black45, fontSize: 17.0),
            ),
          ),
          Container(
            child: Text(
              phoneNumber,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 17.0),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            child: PinFieldAutoFill(
              codeLength: 6,
              onCodeChanged: (val) async {
                if (val.length == 6) {
                  setState(() {
                    otp = val;
                  });
                  final auth_token = await Otpservice().otpVerify(
                      phoneNumber, otp); //verify otp and generate auth token
                  if (auth_token != null) {
                    TokenService().saveToken(auth_token);
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddLocation(auth_token: auth_token),
                        ));
                  }
                }

                print(otp);
              },
//              showFieldAsBox: false,
//              onSubmit: (String otp){
//
//                showDialog(
//                    context: context,
//                    builder: (context){
//                      return AlertDialog(
//                        title: Text("OTP"),
//                        content: Text('OTP is entered '),
//                      );
//                    }
//                );
//                //end showDialog()
//              } ,
            ),
          ),
           Container(
             width: MediaQuery.of(context).size.width,
             margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 45.0),
             alignment: Alignment.center,
             child: new Row(
               children: <Widget>[
                 new Expanded(
                   child: new FlatButton(
                     shape: new RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(30.0),
                     ),
                     color: Colors.redAccent,
                     onPressed: () async {
                       final auth_token = await Otpservice().otpVerify(
                           phoneNumber,
                           otp); //verify otp and generate auth token
                           if(auth_token!=null){
                             TokenService().saveToken(auth_token);
                         return Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => AddLocation(auth_token:auth_token),
                           ));
                           }
                           else{
                             print("Invalid otp");
                           }

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
                               "Verify",
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
          SizedBox(height: 5.0,),
          timerWidget(context),
          Container(
            padding: EdgeInsets.only(
                left: 8.0, right: 8.0, top: 19.0, bottom: 8.0),
            child:
            Container(
              padding: EdgeInsets.all(14.0),
              child: FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Change Mobile Number',
                    style: TextStyle(color: Colors.green, fontSize: 17),
                  )),
            ),
          )
        ],
      ),
    );
  }
}