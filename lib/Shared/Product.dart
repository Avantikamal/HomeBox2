import 'package:flutter/material.dart';

TextEditingController address = new TextEditingController();
Container detailsContainer(BuildContext context, price, index) {
  return Container(
    margin: EdgeInsets.all(15),
    width: MediaQuery.of(context).size.width,
    height: (MediaQuery.of(context).size.height / 2.25),
    child: Wrap(
      children: <Widget>[
        Center(
            child: Text(
          "Place Order",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        Divider(
          height: 50.0,
          thickness: 2.0,
        ),
        Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: address,
                    decoration: InputDecoration(hintText: "Enter Address"),
                    maxLines: 4,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Price:  " + "$price",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Number of Products:  " + "$index",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ))
      ],
    ),
  );
}
