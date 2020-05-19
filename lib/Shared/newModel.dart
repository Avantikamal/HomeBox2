import 'package:flutter/material.dart';
import 'package:homebox/Shared/newProduct.dart';
void newsettingModalBottomSheet(BuildContext context,quantity, price, name) {
  showModalBottomSheet(
      elevation: 8.0,
      // barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: (MediaQuery.of(context).size.height/3),
          child: new Wrap(
            children: <Widget>[
              newdetailsContainer(context, '$quantity', '$price', '$name'),
              Container(
                child: ListTile(
                  leading: new Icon(Icons.add_shopping_cart),
                  title: Text(
                    'Add To Box',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onTap: () {
                    // Navigator.of(context).dispose();
                  },
                ),
                color: Colors.pink,
              ),
            ],
          ),
        );
      });
}
