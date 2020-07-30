import 'package:flutter/material.dart';
import 'package:homebox/models/product.dart';

Product product;
Widget product_container(){

  return GestureDetector(
    child: Container(
      padding: EdgeInsets.only(top: 15.0),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 150,
                    color: Colors.white,
                    child:  Image.asset(product.image)

                    )]),

            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5.0, top: 0.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '${product.title.split(' ')[0]} ',
                      style: TextStyle(
                          color: Color(0xff676767),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: product.title.substring(
                          product.title.split(' ')[0].length + 1,
                          product.title.length),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w400),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.price.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 7),
            ],
          ))
        ],
      ),
    ),
  );
}