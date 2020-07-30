import 'package:flutter/material.dart';


class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Address',
          style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.w800
          ),),
        centerTitle: true,
        leading: IconButton(onPressed: ()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios,
            color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            SizedBox(height: 30.0),
            Text('Where to ship?',
            textAlign: TextAlign.left,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 25.0
              ),),
            SizedBox(height: 8.0),

             Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Name'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Mobile'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Pincode'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'State'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Address(House No, Building,Street,Area)'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Locality/Town'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'City'
                    ),
                  ),
                ),

              ],
            ),

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
                      color: Colors.red,
                      onPressed: () => {},
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
                                "Lets Go",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white
                                    ,
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
      ),
    );
  }
}