import 'package:flutter/material.dart';
import 'package:homebox/screens/address.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homebox/screens/dashboard.dart';
import 'package:homebox/screens/no_delivery_available.dart';
class AddLocation extends StatefulWidget {
  var auth_token;
  AddLocation({this.auth_token});
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {






  List<String> cities=[" Mumbai","Vadodara","Nasirabad","Bhavnagar","Bharuch","Shirpur","kairana"];
  int index;


  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";


        // available_location();
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard(auth_token:widget.auth_token,city: _currentAddress,)));



      });

    } catch (e) {
      print(e);
    }
  }

  available_location() {
    int index;

    if (cities.contains(_currentAddress)==true)
//        await Future.delayed(Duration(seconds: 1),()=>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    else

      //await Future.delayed(Duration(seconds: 1),()=>
      Navigator.push(context, MaterialPageRoute(builder: (context)=> NoDelivery()));


  }



//@override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    available_location();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('Add Location',
            style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.w800
            ),),
          centerTitle: true,
          leading: IconButton(onPressed: ()=> Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios,
              color: Colors.black,),
          ),
        ),
        body: Column(
            children: <Widget>[
              Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500 ,
                      decoration: BoxDecoration(
                          color: Colors.white

                      ),
                    ),
                    Positioned(
                      top: 5.0,
//          left: 10.0,
                      child: Image.asset(
                          "assets/images/location1.jpg",
                          fit: BoxFit.contain,
                          height: 400 ,
                          width: MediaQuery.of(context).size.width ),
                    ),

                    Positioned(
                      top: 440 ,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500 ,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                            )
                        ),
                        child: Column(
                          children: <Widget>[


                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                              alignment: Alignment.center,
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),

                                      onPressed: () => _getCurrentLocation(),


                                      child: new Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20.0,
                                          horizontal: 20.0,
                                        ),
                                        child: new Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[

                                            Icon(Icons.my_location,color: Colors.green,
                                            ),
                                            new Expanded(
                                              child: Text(
                                                "Use my location",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0
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
//        if (_currentPosition != null)
//         Text(_currentAddress),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
                              alignment: Alignment.center,
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),
                                      color: Colors.white,
                                      onPressed: () =>
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Address(),
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
                                                "Add manually",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.red,
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
                          ],
                        ),
                      ),)
                  ]
              )
            ]
        )
    );
  }
}