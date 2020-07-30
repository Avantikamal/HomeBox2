import 'package:flutter/material.dart';
import 'package:homebox/screens/cart_items.dart';
import 'package:homebox/screens/cart_product.dart';
import 'package:homebox/screens/MyCart.dart';
import 'package:homebox/screens/MyCart.dart';



List<cart_item> items=cart_itemList.getItems();
class Product_details extends StatefulWidget {
  @override
  _Product_detailsState createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {

  List<String> wt = new List();

  var selectedWt = 1;

  void addWt(){
    wt.add("1kg");
    wt.add("500gm");
    wt.add("250gm");

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addWt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: <Widget>[

              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500 ,
                    decoration: BoxDecoration(
                        color: Color(0xFFF8F6E1)
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: InkWell(
                                onTap: (){

                                  Navigator.pop(context);
                                },

                                child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                                  onPressed: () {
                                  Navigator.pop(context);
                                  },))),
                        Spacer(),
                        items.length>0?
                        Stack(
                          children: <Widget>[

                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                            ),

                            IconButton(icon: Icon(Icons.shopping_cart,
                              color: Colors.black,size: 30.0,),
                              onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCart()
                              )); },),
                          ],
                        ):

                        IconButton(icon: Icon(Icons.search,
                          color: Colors.black,size: 30.0,),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCart()
                            )); },),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 100.0,
                    left: 100.0,
                    child: Image.asset(
                      "assets/images/organic-food.png",
                      fit: BoxFit.contain,
                      height: 300 ,
                      width: 250 ),
                  ),

                  Positioned(
                    top: 370 ,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 590 ,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green.shade800,
                                borderRadius: BorderRadius.circular(35.0),

                              ),
                              width: 65.0,

                              child: Center(
                                child: Text('23% OFF',
                                style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(" Fresh Apple", style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0 ,
                                   // fontFamily: 'OpenSans'
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(right:8.0),
                                  child: Container(


                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                      borderRadius: BorderRadius.circular(15.0)
                                    ),
                                    child: FlatButton(
                                      onPressed:()=>
                                      items.add(cart_item()),
                                        child: Row(
                                         children: <Widget>[
                                           Text('Add',style: TextStyle(
                                               color: Colors.white
                                           ,fontSize: 15.0),),
                                           Icon(Icons.add,color: Colors.white,),

                                         ],
                                        ),

                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0,  bottom: 10.0),
                            child: Text("₹120 ", style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0 ,
                              // fontFamily: 'OpenSans'
                            ),),
                          ),
Divider(
  thickness: 2.0,
  color: Colors.grey.shade300,
),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Unit", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0 ,
                               // fontFamily: 'OpenSans'
                            ),),
                          ),
Padding(padding: EdgeInsets.only(left: 20.0,top: 5.0,bottom: 13.0),
child:   ConstrainedBox(
  constraints: BoxConstraints(maxHeight: 60),
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return createWtList(index);
    },
    itemCount:wt.length,
  ),
),
//child: Row(
//  children: <Widget>[
//        FloatingActionButton(onPressed: null,
//    heroTag: null,
//
//    child: Text('500 gm',style: TextStyle(fontSize: 10.0,
//
//    color: Colors.white),),
//
//    backgroundColor: Colors.red,
//
//    ),
//        SizedBox(width: 8.0,),
//        FloatingActionButton(onPressed: null,
//          heroTag: null,
//
//          child: Text('500 gm',style: TextStyle(fontSize: 10.0,
//
//              color: Colors.white),),
//
//          backgroundColor: Colors.red,
//
//        ),
//        SizedBox(width: 8.0,),
//        FloatingActionButton(onPressed: null,
//          heroTag: null,
//
//          child: Text('500 gm',style: TextStyle(fontSize: 10.0,
//
//              color: Colors.white),),
//
//          backgroundColor: Colors.red,
//
//        ),
//  ],
//)
),
Divider(thickness: 5.0,
color: Colors.grey.shade300,),
Padding(padding: EdgeInsets.only(left: 20.0,top: 10.0),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text('Features',style: TextStyle(color: Colors.red)
      ,),
    SizedBox(height: 5.0,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Descriptions',style: TextStyle(color: Colors.black)
          ,),
        Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: Icon(Icons.keyboard_arrow_up,
          size: 40,),
        )
      ],
    ),
    Text('An apple in a day keeps the doctor away',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.normal),),
  ],
),)
//                          Padding(
//                            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
//                            child: Text('''Avocado trees are partially self-pollinating and are
//often propogated through grafting to maintain a
//predictable quality of the fruit''', style: TextStyle(
//                                color: Colors.grey,
//
//                                letterSpacing: 0.2,
//
//                                fontSize: 12.0 ,
//                              //  fontFamily: 'OpenSans'
//                            ),),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
//                            child: Row(
//                              children: <Widget>[
//                                Row(
//                                  children: <Widget>[
//                                    Container(
//                                      decoration: BoxDecoration(
//                                          borderRadius: BorderRadius.circular(5.0),
//                                          border: Border.all(color: Colors.grey)
//                                      ),
//                                      child: Padding(
//                                        padding: const EdgeInsets.only(left:5.0, right: 5.0),
//                                      child: InkWell(
//                                        child: new Icon(Icons.remove, size: 15,),
//                                        onTap:  (){
//                                          if(_quantity>1) {
//                                            setState(() {
//                                              _quantity--;
//                                            });
//                                          }
//                                        },
//                                      ),
////                                          Text("+", style: TextStyle(
////                                          color: Colors.black,
////                                          fontWeight: FontWeight.bold,
////                                          fontSize: 35.0 ,
////
////                                        ),),
//                                      ),
//                                    ),
//                                    SizedBox(width: 3 ),
//                                    Text(_quantity.toString(), style: TextStyle(
//                                        color: Colors.black,
//                                        fontWeight: FontWeight.bold,
//                                        fontSize: 30 ,
//                                       // fontFamily: 'OpenSans'
//                                    ),),
//                                    SizedBox(width: 3 ),
//                                    Container(
//                                      decoration: BoxDecoration(
//                                          borderRadius: BorderRadius.circular(5.0),
//                                          border: Border.all(color: Colors.grey),
//
//                                      ),
//                                      child: Padding(
//                                        padding: const EdgeInsets.only(left:5.0, right: 5.0),
//                                        child: InkWell(
//                                          child: new Icon(Icons.add, size: 15,),
//                                          onTap: (){
//                                            setState(() {
//                                              _quantity++;
//                                            });
//                                          },
//                                        ),
////                                        Text("-", style: TextStyle(
////                                            color: Colors.black,
////                                            fontWeight: FontWeight.bold,
////                                            fontSize: 35.0 ,
////
////                                        ),),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                Spacer(),
//                                Text("₹120", style: TextStyle(
//                                    color: Colors.black,
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 35.0,
//                                    //fontFamily: 'OpenSans-Bold'
//                                ),),
//                              ],
//                            ),
//                          ),
//                          SizedBox(height:2.0,),
//                          Padding(
//                            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
//                            child: Row(
//                              children: <Widget>[
//                                Row(
//                                  children: <Widget>[
//                                    Icon(Icons.airport_shuttle),
//                                    SizedBox(width: 3 ,),
//                                    Text("Standard: Friday Evening", style: TextStyle(
//                                        color: Colors.black,
//                                        fontWeight: FontWeight.bold,
//                                        letterSpacing: 0.2,
//                                        fontSize: 10.0 ,
//                                        //fontFamily: 'OpenSans'
//                                    ),),
//                                  ],
//                                ),
//                                Spacer(),
//                                Text("You save : 20%", style: TextStyle(
//                                    color: Colors.black,
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 10.0 ,
//                                  //  fontFamily: 'OpenSans-Bold'
//                                ),),
//                              ],
//                            ),
//                          ),
//                          SizedBox(height: 3 ,),
//                          Padding(
//                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//                            child: Row(
//                              children: <Widget>[
//                                Container(
//                                  decoration: BoxDecoration(
//                                      color: Colors.white,
//                                      border: Border.all(color: Colors.green),
//                                      borderRadius: BorderRadius.circular(5.0)
//                                  ),
//                                  child: Padding(
//                                    padding: const EdgeInsets.all(20.0),
//                                    child: Icon(Icons.favorite_border, color: Colors.green,),
//                                  ),
//                                ),
//                                SizedBox(width: 3,),
//                                Expanded(
//                                  child: Container(
//                                    decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.circular(10.0),
//                                        color: Colors.red
//                                    ),
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(20.0),
//                                      child: Row(
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          Icon(Icons.shopping_basket, color: Colors.white,),
//                                          SizedBox(width: 1 ),
//                                          Text("Add", style: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: 20.0 ,
//                                              fontWeight: FontWeight.bold,
//                                           //   fontFamily: 'OpenSans-Bold'
//                                          ),)
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                )
//                              ],
//                            ),
//                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),

        );
  }

  GestureDetector   createWtList(int index) {
    return GestureDetector(
    child: Container(
      child: Center(
        child: Text(wt[index],
          style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.8)),
          textAlign: TextAlign.center,
        ),
      ),
      width: 70,
      margin: EdgeInsets.all(2),
      height: 70,
      decoration: BoxDecoration(

               color: selectedWt == index ? Colors.red : Colors.lightBlueAccent.shade100,
          shape: BoxShape.circle),
    ),
    onTap: () {
      setState(() {
        selectedWt = index;

      });
    },
  );



  }
}
