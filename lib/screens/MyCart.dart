import 'package:flutter/material.dart';
import 'package:homebox/screens/dashboard.dart';
import 'package:homebox/screens/profile.dart';
import 'Checkout.dart';
import 'package:homebox/screens/product_details.dart';
import 'package:homebox/screens/cart_items.dart';
import 'package:homebox/screens/cart_product.dart';
                                                          //hard coded
class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
//  final GlobalKey<ScaffoldState>  _scaffoldKey = new GlobalKey<ScaffoldState>();
  int qty=1;
  int totalAmount = 1500;

  List<cart_item> items=cart_itemList.getItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0.0,
  title: Text('Your Cart',
  style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 23.0
  ),),
  centerTitle: true,
  actions: <Widget>[
    FlatButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
        },
        child: CircleAvatar()),
  ],
  leading:    IconButton(
      alignment: Alignment.topLeft,
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {}),
),
      body:
      items.length>0 ?
      Column(
        children: <Widget>[
          Flexible(
            child: ListView(
                shrinkWrap: true,
                children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                Container(
                  padding: EdgeInsets.only(top: 25.0,bottom: 180.0),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child:
                 // items.length>0 ?
                      ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context,int index){
                          return Dismissible(
                            onDismissed: (DismissDirection direction) {
                              setState(() {
                                items.removeAt(index);
                              });
                            },secondaryBackground: Container(
                            child: Center(
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            color: Colors.red,
                          ),
                            background: Container(),
                            child: Cart_product(cart: items[index],),
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                          );
                        }
                      )
//
//                     :
//                  Center(child: Text('No Items')),

//                  ListView(
//                    children: <Widget>[
//                      products(context),
//                      SizedBox(height: 8.0,),
//                      products(context)
//                    ],
//    ),
//                ),
                ) ])
            ]),
          ),
          Material(                         //checkout section
            //Checkout section
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Checkout Price:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          "₹1500",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: Colors.red,
                    elevation: 1.0,
                    child: InkWell(
                      splashColor: Colors.redAccent,
                      onTap: () {},
                      child: InkWell(
                        onTap: () {

                        },
                        child: FlatButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Checkout()));
                          },

                          child: Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Checkout",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
          :
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               child: Image.asset('assets/images/empty.png'),
             ),
           ),
           SizedBox(height: 10.0,),
           Text('Your cart is empty'
           ,style: TextStyle(
               color: Colors.black54
             ),),

           SizedBox(height: 40.0,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               decoration: BoxDecoration(
                 color: Colors.red,
                 borderRadius: BorderRadius.circular(20.0)
               ),
               child: FlatButton(onPressed: ()=> Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> Dashboard())),
                   child: Center(child: Text('Continue Shopping',style: TextStyle(color: Colors.white),))),
             ),
           )
         ],
       )   

    );
  }
  Widget products(context) {
    return InkWell(
      onTap: () =>
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Product_details())),
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 0.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 10.0, bottom: 0.0),
            width: MediaQuery
                .of(context)
                .size
                .width - 20.0,
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
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            'Net wt. 1kg',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300,
                                color: Colors.grey.shade700),
                          ),
                          Text('₹120',
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
                    padding: const EdgeInsets.only(
                        left: 70.0, top: 24.0, bottom: 3.0),
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
                          child: Center(child: Text(qty.toString(),
                            style: TextStyle(color: Colors.black),)),
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

  }

