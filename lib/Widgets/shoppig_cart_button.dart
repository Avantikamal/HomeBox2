import 'package:flutter/material.dart';
import 'package:homebox/screens/MyCart.dart';
Widget shoppingCartIconButton() {
        return new Padding(
          padding:
          const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 25, left: 10),
          child: new Container(
            height: 150.0,
            width: 30.0,
            child: new GestureDetector(

              child: new Stack(
                children: <Widget>[
                  new IconButton(
                    iconSize: 30,
                    icon: new Icon(
                      Icons.shopping_cart,
                      color: Colors.black
                    ),
                    onPressed: null,
                  ),
                  new Positioned(
                    child: Container(
                      width: 21.0,
                      height: 21.0,
                      child: new Stack(
                        children: <Widget>[
                          new Icon(Icons.brightness_1,
                              size: 21.0, color: Colors.yellow),
                          new Center(

                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );

}
Widget searchBar() {

        return GestureDetector(
//            onTap: () {
//              MaterialPageRoute route =
//              MaterialPageRoute(builder: (context) => ProductSearch());
//              Navigator.of(context).push(route);
//            },
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
               // width: MediaQuery.of(context).size.width,
                height: 49,
                margin: EdgeInsets.all(010),
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: Text(
                    'Find the best for your pet...',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ),

            ]));

}