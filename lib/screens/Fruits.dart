import 'package:flutter/material.dart';
import 'package:homebox/screens/product_details.dart';
class Fruits extends StatefulWidget {
  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {

  Widget single_product=  Container(
    padding: const EdgeInsets.all(2.0),
    decoration: BoxDecoration(
//      borderRadius:
//      BorderRadius.all(Radius.circular(15.0)),
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height:80.0,
            child: Image.asset('assets/images/organic-food.png',fit: BoxFit.cover,)
        ),
        SizedBox(height: 1.0,),
        Text('Item1'),
        SizedBox(height: 1.0,),
        Text('500 g,',style: TextStyle(
            color: Colors.grey.shade400
        ),),
        SizedBox(height: 1.0,),
        Row(
          children: <Widget>[
            Text('Rs.500'),
            SizedBox(width: 80.0,),
            InkWell(
              child: Icon(Icons.shopping_cart,
                color: Colors.red,),
            ),
          ],
        )

      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
//      appBar: AppBar(
//
//
//        title: Text('Fruits',style: TextStyle(
//          fontSize: 25.0,
//          fontFamily: 'Poppins',
//            fontWeight: FontWeight.w500
//        ),),
//        actions: <Widget>[
//          Row(
//            children: <Widget>[
//              Icon(Icons.search,color: Colors.black,),
//              SizedBox(width: 10.0,),
//              Icon(Icons.shopping_cart,color: Colors.black,),
//              SizedBox(width: 5.0),
//            ],
//          )
//        ],
//      ),
      body:  CustomScrollView(
        shrinkWrap: true,
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              children: <Widget>[
              InkWell
                (
                  onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Product_details()
                ));
                },
              child: single_product
              ),
              InkWell
                (
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product_details()
                        ));
                  },
                  child: single_product
              ),
              InkWell
                (
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product_details()
                        ));
                  },
                  child: single_product
              ),
              single_product,
              single_product,
              single_product,
              single_product,
              single_product,
              single_product,
              single_product,
              single_product,
              single_product,

              ],
            ),
          ),
        ],
      )
    );
  }
}
