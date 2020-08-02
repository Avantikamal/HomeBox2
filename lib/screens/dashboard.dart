import 'dart:async';
import 'package:homebox/Widgets/search_bar.dart';
import 'package:homebox/screens/MyCart.dart';
import 'package:homebox/screens/Orders.dart';
import 'package:flutter/material.dart';

import 'package:homebox/screens/product_details.dart';
import 'package:homebox/screens/profile.dart';
import 'package:homebox/screens/refer_earn.dart';
import 'package:homebox/screens/subCategory.dart';
import 'package:homebox/screens/AboutUs.dart';
class Dashboard extends StatefulWidget {
  String auth_token;
  final String city;
  Dashboard({this.city, this.auth_token});

  @override
  _DashboardState createState() => _DashboardState(this.city,auth_token);
}

class _DashboardState extends State<Dashboard> {
  String city;
  String auth_token;
  _DashboardState(this.city, this.auth_token);
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  final GlobalKey<ScaffoldState>  _scaffoldKey = new GlobalKey<ScaffoldState>();
String city1= "";
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    String city1=this.city;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,

      );
    });

  }


  Widget products(context){
    return  InkWell(
      onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Product_details())),
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
                color: Colors.red.shade50,
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
                            'Net wt. 1kg',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300,
                                color: Colors.grey.shade700),
                          ),
                          Text('₹120' ,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:70.0,top: 24.0,bottom: 3.0),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              qty++;
                            });
                          },
                          splashColor: Colors.redAccent.shade200,
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green.shade800),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Center(child: Text(qty.toString(),style: TextStyle(color: Colors.black),)),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              qty--;
                            });
                          },
                          splashColor: Colors.redAccent.shade200,
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.pink),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                ]),
          ),
        ),
      ),
    );
  }

  String image;
  String category;
  int qty=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(city,style: TextStyle(
          color: Colors.red,
          fontSize: 16.0,
          fontWeight:   FontWeight.w700
        ),),
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.location_on,color: Colors.red,
        ),
        actions: <Widget>[
          Row(
      children: <Widget>[
          FlatButton(
              onPressed: (){
                _scaffoldKey.currentState.openEndDrawer();
              },
              child: CircleAvatar()),
        IconButton(icon:Icon(Icons.shopping_cart,
          color: Colors.black,size: 30.0,), onPressed: () { 
          Navigator.push(context,   MaterialPageRoute(builder: (context)=> MyCart() ));
        },)
        ]
          )
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Text('What are you looking for..',
                       style: TextStyle(fontWeight: FontWeight.w700,
                       fontSize: 20.0),),
                       IconButton(icon: Icon(Icons.search,
                         color: Colors.black,
                       size: 27.0,), onPressed:
                           ()=> showSearch(context: context, delegate: Search())
                       )
                     ],
                   ),
                 ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180.0,
                  child: PageView(
                    scrollDirection: Axis.horizontal,

                    controller: _pageController,
                    children: <Widget>[
                      Container(
                        //height: 150.0,
                        // padding: EdgeInsets.only(left:10.0,right: 10.0),
                        decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(20.0),
                            image: DecorationImage(image:  AssetImage( "assets/images/p3.jpg"),
                                fit: BoxFit.cover)
                        ),
                        //child: Image.asset( "assets/images/p3.jpg"),
                      ),
                      Container(
                      //  height: 150.0,
                        // padding: EdgeInsets.only(left:10.0,right: 10.0),
                        decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(20.0),
                            image: DecorationImage(image:  AssetImage( "assets/images/p1.jpg"),
                                fit: BoxFit.cover)
                        ),
                        //child: Image.asset( "assets/images/p3.jpg"),
                      ),
                      Container(
                       // height: 150.0,
                        // padding: EdgeInsets.only(left:10.0,right: 10.0),
                        decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(20.0),
                            image: DecorationImage(image:  AssetImage( "assets/images/p3.jpg"),
                                fit: BoxFit.cover)
                        ),
                        //child: Image.asset( "assets/images/p3.jpg"),
                      ),
                    ],
                  ),
                )
              ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,
                  right: 8.0,top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Explore by Category',style: TextStyle(
                        fontSize: 18.0
                      ),
                      ),
                      FlatButton(
                        splashColor:  Colors.white,
                          onPressed: ()=>
                              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Subcategory())),
                          child: Row(
                            children: <Widget>[
                              Text('view All',style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black87
                      ),),
                              Icon(Icons.arrow_right,color: Colors.black,)
                            ],
                          ))
                    ],

                  ),
                ),

              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
//                    onTap: ()=> Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => Categories())),
    child: Column(
    children: <Widget>[
    Container(
    height: 80.0,
    width: 95.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    image: DecorationImage(image: AssetImage('assets/images/category1.png'),
    fit: BoxFit.cover)
    ),
    padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 18.0),
    //child: Image.asset(image),
    ),
    SizedBox(height: 3.0,),
    Text('Vegetable',style: TextStyle(fontWeight: FontWeight.w500),),
    ],
    ),
                    ),
                    //SizedBox(width: 7.0,),
                    InkWell(
//                      onTap: ()=> Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => Categories())),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 80.0,
                            width: 95.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(image: AssetImage('assets/images/category1.png'),
                                    fit: BoxFit.cover)
                            ),
                            padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 18.0),
                            //child: Image.asset(image),
                          ),
                          SizedBox(height: 3.0,),
                          Text('Vegetable',style: TextStyle(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    InkWell(
//                      onTap: ()=> Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => Categories())),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 80.0,
                            width: 95.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(image: AssetImage('assets/images/category1.png'),
                                    fit: BoxFit.cover)
                            ),
                            padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 18.0),
                            //child: Image.asset(image),
                          ),
                          SizedBox(height: 3.0,),
                          Text('Vegetable',style: TextStyle(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),   ],
                    ),
              ),

//                  InkWell(
//                    onTap: ()=> Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => Categories())),
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          height: 80.0,
//                          width: 95.0,
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(10.0),
//                              image: DecorationImage(image: AssetImage( "assets/images/organic-food.png"),
//                                  fit: BoxFit.cover)
//                          ),
//                          padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 18.0),
//                          //child: Image.asset(image),
//                        ),
//                        SizedBox(height: 3.0,),
//                        Text(category),
//                      ],
//                    ),
//                  ),
//                  InkWell(
//                    onTap: ()=> Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => Categories())),
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          height: 80.0,
//                          width: 95.0,
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(10.0),
////                              image: DecorationImage(image:
////                                  fit: BoxFit.cover)
//                          ),
//                          padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 18.0),
//                          //child: Image.asset(image),
//                        ),
//                        SizedBox(height: 3.0,),
//                        Text(category),
//                      ],
//                    ),
//                  ),
//                ],
//
//              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 19.0),
                child: Text('Top Deals',style: TextStyle(
                  color: Colors.red,
                  fontSize: 18.0
                ),
               ),
              ),
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 12.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
  height: 170,
  decoration: BoxDecoration(
    color: Colors.red.shade50,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0))
  ),

child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      InkWell(
      onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Product_details())),
                child: Padding(
                  padding: EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,bottom: 0.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 0.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 15.0, right: 10.0,bottom: 0.0),
                      width: MediaQuery.of(context).size.width - 20.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.red.shade50,
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
                                  'Net wt. 1kg',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w300,
                                  color: Colors.grey.shade700),
                                ),
                                Text('₹120' ,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        ),
                                Padding(
                                  padding: const EdgeInsets.only(left:70.0,top: 24.0,bottom: 3.0),
                                  child: Column(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            qty++;
                                          });
                                        },
                                        splashColor: Colors.redAccent.shade200,
                                        child: Container(
                                          height: 20.0,
                                          width: 20.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                          color: Colors.green.shade800),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Container(
                                        height: 30.0,
                                        width: 30.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white),
                                        child: Center(child: Text(qty.toString(),style: TextStyle(color: Colors.black),)),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            qty--;
                                          });
                                        },
                                        splashColor: Colors.redAccent.shade200,
                                        child: Container(
                                          height: 20.0,
                                          width: 20.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.pink),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                      ]),
                    ),
                  ),
                ),
              ),
      Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
  //    InkWell(
  //      onTap: ()=> Navigator.push(
  //          context,
  //          MaterialPageRoute(
  //              builder: (context) => Product_details())),
  //      child: Padding(
  //        padding: EdgeInsets.only(left:8.0,right: 8.0,top: 0.0,bottom: 0.0),
  //        child: Material(
  //          borderRadius: BorderRadius.circular(10.0),
  //          elevation: 0.0,
  //          child: Container(
  //            padding: EdgeInsets.only(left: 15.0, right: 10.0,bottom: 0.0),
  //            width: MediaQuery.of(context).size.width - 20.0,
  //            height: 150.0,
  //            decoration: BoxDecoration(
  //                color: Colors.red.shade50,
  //                borderRadius: BorderRadius.circular(10.0)),
  //            child: Row(
  //
  //                children: <Widget>[
  //                  Container(
  //                    height: 80.0,
  //                    width: 95.0,
  //                    decoration: BoxDecoration(
  //                        color: Colors.white,
  //                        image: DecorationImage(
  //                            image: AssetImage('assets/images/p3.jpg'),
  //                            fit: BoxFit.contain)),
  //                  ),
  //                  Flexible(
  //                    child: Padding(
  //                      padding: const EdgeInsets.only(left: 10),
  //                      child: Column(
  //                        crossAxisAlignment: CrossAxisAlignment.start,
  //                        mainAxisAlignment: MainAxisAlignment.center,
  //                        children: <Widget>[
  //                          Flexible(
  //                            child: Text(
  //                              "Fresh Banana",
  //                              style: TextStyle(
  //                                  fontWeight: FontWeight.w700, fontSize: 17,color: Colors.black),
  //                            ),
  //                          ),
  //                          Text(
  //                            'Net wt. 1kg',
  //                            style: TextStyle(
  //                                fontSize: 14, fontWeight: FontWeight.w300,
  //                                color: Colors.grey.shade700),
  //                          ),
  //                          Text('₹120' ,
  //                              style: TextStyle(
  //                                fontSize: 16,
  //                                fontWeight: FontWeight.w700,
  //                                color: Colors.red,
  //                              )),
  //                        ],
  //                      ),
  //                    ),
  //                  ),
  //                  Padding(
  //                    padding: const EdgeInsets.only(left:70.0,top: 24.0,bottom: 3.0),
  //                    child: Column(
  //                      children: <Widget>[
  //                        InkWell(
  //                          onTap: () {
  //                            setState(() {
  //                              qty++;
  //                            });
  //                          },
  //                          splashColor: Colors.redAccent.shade200,
  //                          child: Container(
  //                            height: 20.0,
  //                            width: 20.0,
  //                            decoration: BoxDecoration(
  //                                borderRadius: BorderRadius.circular(5),
  //                                color: Colors.green.shade800),
  //                            alignment: Alignment.center,
  //                            child: Icon(
  //                              Icons.add,
  //                              color: Colors.white,
  //                              size: 20,
  //                            ),
  //                          ),
  //                        ),
  //                        SizedBox(
  //                          height: 8.0,
  //                        ),
  //                        Container(
  //                          height: 30.0,
  //                          width: 30.0,
  //                          decoration: BoxDecoration(
  //                              borderRadius: BorderRadius.circular(5),
  //                              color: Colors.white),
  //                          child: Center(child: Text(qty.toString(),style: TextStyle(color: Colors.black),)),
  //                        ),
  //                        SizedBox(
  //                          height: 8.0,
  //                        ),
  //                        InkWell(
  //                          onTap: () {
  //                            setState(() {
  //                              qty--;
  //                            });
  //                          },
  //                          splashColor: Colors.redAccent.shade200,
  //                          child: Container(
  //                            height: 20.0,
  //                            width: 20.0,
  //                            decoration: BoxDecoration(
  //                                borderRadius: BorderRadius.circular(5),
  //                                color: Colors.pink),
  //                            alignment: Alignment.center,
  //                            child: Icon(
  //                              Icons.remove,
  //                              color: Colors.white,
  //                              size: 20,
  //                            ),
  //                          ),
  //                        ),
  //                      ],
  //                    ),
  //                  ),
  //
  //
  //                ]),
  //          ),
  //        ),
  //      ),
  //    ),
      products(context),
      Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
      products(context),
      Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
      products(context),
      Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
      products(context),
      Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
      products(context),
      Padding(
        padding: const EdgeInsets.only(left:130.0,top: 0.0,right: 8.0),
        child: Divider(thickness: 2.0,),
      ),
      products(context)

    ],

  ),
),
),
          )

            ],
        ),
      ),
      endDrawer: Drawer(

        child: ListView(
          children: <Widget>[
            DrawerHeader(

              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0))
              ),

            child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 4.0),
                child: InkWell(
                  onTap: ()=>Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>Profile())),
                  child: CircleAvatar(
                    radius: 30.0,
                  ),
                ),
              ),
              SizedBox(width: 3.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: ()=>Navigator.push(
        context, MaterialPageRoute(builder: (context)=>Profile())),
                    child: Text('Person_name',style: TextStyle(
    fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),),
                  ),
                  SizedBox(height: 2.0,),
                ],
              ),
            ],
        ),

              ),


            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Orders())),
              child: ListTile(
                leading: Icon(Icons.local_mall) ,
                title: Text('My Orders'),
              ),
            ),
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart())),
              child: ListTile(
                leading: Icon(Icons.shopping_cart) ,
                title: Text('My Cart'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.credit_card) ,
              title: Text('My Wallet'),
            ),
            ListTile(
              leading: Icon(Icons.local_offer) ,
              title: Text('Offer & Deals'),
            ),
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Refer_earn())),
              child: ListTile(
                leading: Icon(Icons.card_giftcard) ,
                title: Text('Refer & Earn'),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('OTHER'),
            ),
            ListTile(
              leading: Icon(Icons.star) ,
              title: Text('Rate Us'),
            ),
            ListTile(
              leading: Icon(Icons.share) ,
              title: Text('Share'),
            ),
            InkWell(
              onTap:  ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>aboutUs())),
              child: ListTile(
                leading: Icon(Icons.tag_faces) ,
                title: Text('About Us'),
              ),
            ),
          ],

        ),
      ),
     key: _scaffoldKey,
    );
  }

}
