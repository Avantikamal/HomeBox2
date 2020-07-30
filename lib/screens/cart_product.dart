import 'package:flutter/material.dart';
import 'package:homebox/screens/cart_items.dart';
class Cart_product extends StatelessWidget {
  cart_item cart;
  Cart_product({this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15.0, right: 10.0, bottom: 0.0),
    width: MediaQuery.of(context).size.width - 20.0,
    height: 145.0,
    decoration: BoxDecoration(
    color: Colors.red.shade50,
    borderRadius: BorderRadius.circular(10.0)),
      child: Column(

        children: <Widget>[
          ListTile(
            leading:  Container(
              height: 80.0,
              width: 95.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(cart.image),
                      fit: BoxFit.contain)),
            ),
            title:  Text(
              cart.title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Colors.black),
            ),
            subtitle:   Column(
              children: <Widget>[
                Text(
                  'Net wt. ${cart.wt}',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w300,
                      color: Colors.grey.shade700),
                ),
                Text(cart.price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    )),
              ],
            ),
//            trailing: Column(
//              children: <Widget>[
//                InkWell(
//                  onTap: () {
//                    setState(() {
//                      qty++;
//                    });
//                  },
//                  splashColor: Colors.redAccent.shade200,
//                  child: Container(
//                    height: 20.0,
//                    width: 20.0,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(5),
//                        color: Colors.green.shade800),
//                    alignment: Alignment.center,
//                    child: Icon(
//                      Icons.add,
//                      color: Colors.white,
//                      size: 20,
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  height: 8.0,
//                ),
//                Container(
//                  height: 30.0,
//                  width: 30.0,
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(5),
//                      color: Colors.white),
//                  child: Center(child: Text(qty.toString(),
//                    style: TextStyle(color: Colors.black),)),
//                ),
//                SizedBox(
//                  height: 8.0,
//                ),
//                InkWell(
//                  onTap: () {
//                    setState(() {
//                      qty--;
//                    });
//                  },
//                  splashColor: Colors.redAccent.shade200,
//                  child: Container(
//                    height: 20.0,
//                    width: 20.0,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(5),
//                        color: Colors.pink),
//                    alignment: Alignment.center,
//                    child: Icon(
//                      Icons.remove,
//                      color: Colors.white,
//                      size: 20,
//                    ),
//                  ),
//                ),
//              ],
//            ),
          trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
          )
        ],
      ),
    );
  }
}
