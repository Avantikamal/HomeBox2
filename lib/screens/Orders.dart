import 'package:flutter/material.dart';
import 'package:homebox/screens/MyCart.dart';
import 'package:homebox/HomePage.dart';
import 'package:homebox/screens/track_order.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        elevation: 0.0,

      leading: IconButton(
          onPressed: ()=>
              Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart())),
              icon: Icon(Icons.shopping_cart,color: Colors.black,
              size: 30.0,),
            ),
          )
        ],

      ),
//      drawer: Drawer(
//        child: ListView(
//
//          children: <Widget>[
//            ListTile(
//              title: Text(
//                'Our Vendors',
//                style: TextStyle(
//                  fontFamily: 'Poppins',
//                ),
//              ),
//            ),
//            ListTile(
//              title: Text(
//                'Organic Farms',
//                style: TextStyle(
//                  fontFamily: 'Poppins',
//                ),
//              ),
//            ),
//            Divider(
//              thickness: 1.0,
//            ),
//            ListTile(
//              title: Text(
//                'Deals Of The Day',
//                style: TextStyle(
//                  fontFamily: 'Poppins',
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
      body: Padding(
        padding: const EdgeInsets.only(left:0.0,right: 0.0,top: 8.0),
        child: ListView(
    children: <Widget>[
      itemCard(context),
      Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
      itemCard(context),
      Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
      itemCard(context),
      Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
      itemCard(context), Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
      itemCard(context)
      
    ],
//            itemCount: 8,
//            itemBuilder: (BuildContext context, int index) {
//              return itemCard(index);
//            }),
      ),
      ));
  }

  Widget itemCard(context) {

   return InkWell(
      onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Track_Order())),
      child: Padding(
        padding: EdgeInsets.only(left:8.0,right: 8.0,top: 0.0,bottom: 0.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 10.0,bottom: 0.0),
            width: MediaQuery.of(context).size.width - 20.0,
            height: 150.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(

                children: <Widget>[
                  Container(
                    height: 80.0,
                    width: 95.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/images/p3.jpg'),
                            fit: BoxFit.contain)),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              "Fresh Banana",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17,color: Colors.black),
                            ),
                          ),
                          Text(
                            'Delivered ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300,
                                color: Colors.grey.shade700),
                          ),
                          Text('07-Jul-2020' ,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade700,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:70.0,top: 24.0,bottom: 3.0),
                    child: IconButton(icon: Icon(Icons.arrow_forward_ios,color: Colors.black,), onPressed: null)
                  ),


                ]),
          ),
        ),
      ),
    );
  }
}