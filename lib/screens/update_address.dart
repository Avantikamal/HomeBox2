import 'package:flutter/material.dart';
import 'package:homebox/models/address.dart';
import 'package:flutter/cupertino.dart';

class UpdateAddress extends StatefulWidget {
  final bool order;
  final Address shipAddress;
  UpdateAddress({this.shipAddress,this.order});
  @override
  _UpdateAddressState createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  String _firstName = '';
  String _lastName = '';
  String selectedState = 'State';
  String _address1 = '';
  String _address2 = '';
  String _city = '';
  String _mobile = '';
  String _pincode = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    getStates();
    // getUserInfo();
    super.initState();
    if (widget.shipAddress != null) {
      selectedState = widget.shipAddress.stateAbbr;
      _firstName = widget.shipAddress.firstName;
      _lastName = widget.shipAddress.lastName;
      _address2 = widget.shipAddress.address2;
      _city = widget.shipAddress.city;
      _address1 = widget.shipAddress.address1;
      _mobile = widget.shipAddress.mobile;
      _pincode = widget.shipAddress.pincode;

    }

  }

  bool _stateEmpty = false;
  bool _isStateChecked = false;
  static List<Map<String, dynamic>> states = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
            widget.shipAddress != null ? 'Update Address' : 'Add Address'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom:  PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(10),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            child:IconButton(
              icon: Icon(Icons.check),
//              onPressed: () {
//                submitAddress(model);
//              },
            ) ,)

        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(25),
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            buildFirstNameField('First Name'),
            SizedBox(
              height: 45,
            ),
            buildLastNameField('Last Name'),
            SizedBox(
              height: 45,
            ),
            buildMobileField('Phone Number'),
            SizedBox(
              height: 45,
            ),
            buildAddressField('Street Address'),
            SizedBox(
              height: 45,
            ),
            buildTownField('City/Town'),
            SizedBox(
              height: 45,
            ),
            buildCityField('District'),
            SizedBox(
              height: 45,
            ),
            Row(
              children: <Widget>[
                buildStateField('State'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: buildPinCodeField('Pincode'),
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            sendButton(),
          ],
        ),
      ),
    );
  }

 Widget buildFirstNameField(String label) {
   return TextFormField(
     validator: (String value) {
       if (value.isEmpty) {
         return 'First Name is required';
       }
     },
     decoration:InputDecoration(
         labelText: label,
         labelStyle: TextStyle(color: Colors.grey.shade500),
         contentPadding: EdgeInsets.all(0.0)),
     initialValue: _firstName,
     onSaved: (String value) {
       print("SETTING LAST NAME ------> $value");
       setState(() {
         _firstName = value;
       });
     },
   );



 }

  Widget buildAddressField(String label) {
    return TextFormField(
      // maxLines: 5,
      initialValue: _address1,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is required';
        }
      },
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: EdgeInsets.all(0.0)),
      onSaved: (String value) {
        setState(() {
          _address1 = value;
        });
      },
    );
  }

  Widget buildTownField(String label) {
    return TextFormField(
      initialValue: _address2,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Locality/Town is required';
        }
      },
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: EdgeInsets.all(0.0)),
      onSaved: (String value) {
        setState(() {
          _address2 = value;
        });
      },
    );
  }

  Widget buildCityField(String label) {
    return TextFormField(
      initialValue: _city,
      validator: (String value) {
        if (value.isEmpty) {
          return 'City is required';
        }
      },
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: EdgeInsets.all(0.0)),
      onSaved: (String value) {
        setState(() {
          _city = value;
        });
      },
    );
  }

  Widget buildMobileField(String label) {
    return TextFormField(
      initialValue: _mobile,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Mobile No. is required!';
        } else if (!RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Please enter numeric value only';
        } else if (value.trim().length != 10) {
          return 'Mobile No. should be 10 digits only!';
        }
      },
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: EdgeInsets.all(0.0)),
      onSaved: (String value) {
        setState(() {
          _mobile = value;
        });
      },
    );
  }

  Widget buildPinCodeField(String label) {
    return TextFormField(
      initialValue: _pincode,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Pincode is required!';
        } else if (!RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Please enter numeric value only';
        } else if (value.trim().length != 6) {
          return 'Pincode should be 6 digits only!';
        }
      },
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: EdgeInsets.all(0.0)),
      onSaved: (String value) {
        setState(() {
          _pincode = value;
        });
      },
    );
  }

  Widget buildLastNameField(String label) {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Last Name is required';
        }
      },
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: EdgeInsets.all(0.0)),
      initialValue: _lastName,
      onSaved: (String value) {
        print("SETTING LAST NAME ------> $value");
        setState(() {
          _lastName = value;
        });
      },
    );
  }
  Widget buildStateField(String label) {
    List<CupertinoActionSheetAction> actions = states.map((item) {
      return CupertinoActionSheetAction(
        child: Text(
          item['name'],
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey.shade500),
        ),
        onPressed: () {
          Navigator.pop(context, item['abbr']);
        },
      );
    }).toList();
    return GestureDetector(
        onTap: () {
          containerForSheet<String>(
            context: context,
            child: CupertinoActionSheet(
              title: Text(
                'Select State',
                style: TextStyle(color: Colors.grey.shade500),
              ),
              actions: actions,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.40,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  selectedState,
                  style: TextStyle(
                      color:
                      _isStateChecked ? Colors.black : Colors.grey.shade500,
                      fontSize: 16),
                )),
            SizedBox(
              height: 6,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Divider(
                // endIndent: ,
                color: Colors.black,
              ),
            ),
            _stateEmpty
                ? Text(
              "State is required.",
              style: TextStyle(color: Colors.red),
            )
                : Container()
          ],
        ));
  }
  void containerForSheet<Map>({BuildContext context, Widget child}) {
    showCupertinoModalPopup<Map>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((Map value) {
      setState(() {
        if (value == null) {
          selectedState = 'State';
        } else {
          _isStateChecked = true;
          _stateEmpty = false;
          selectedState = value.toString();
          states.forEach((state) {
            if (state.containsValue(value.toString())) {

            }
          });
        }
      });
    });
  }
  Widget sendButton() {
          return FlatButton(
            color: Colors.red,
//            onPressed: () {
//              submitAddress();
//            },
            child: Text(
              'SAVE ADDRESS',
              style: TextStyle(color: Colors.white),
            ),
          );

  }
  getStates() async {


      setState(() {
     //   states.add();
      });

    if (widget.shipAddress == null) {
      setState(() {
        selectedState = 'State';
      });
    }
  }

}
