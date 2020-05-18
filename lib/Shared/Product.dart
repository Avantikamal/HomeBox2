import 'package:flutter/material.dart';

Container detailsContainer(BuildContext context, img, price, name, vendors) {
  return Container(
    margin: EdgeInsets.all(15),
    width: MediaQuery.of(context).size.width,
    height: (MediaQuery.of(context).size.height / 2.25),
    child: Wrap(
      children: <Widget>[
        Center(child: Image.asset('$img')),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$name',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0),
              ),
              Text(
                '$price',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 20.0,
          child: Row(
            children: <Widget>[
              Text(
                '$vendors',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  color: Colors.white30,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
