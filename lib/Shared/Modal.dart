import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:homebox/Shared/Product.dart';

void settingModalBottomSheet(BuildContext context, img, price, name, vendors) {
  showModalBottomSheet(
      elevation: 8.0,
      // barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: (MediaQuery.of(context).size.height / 2.15),
          child: new Wrap(
            children: <Widget>[
              detailsContainer(context, '$img', '$price', '$name', '$vendors'),
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
                    Navigator.of(context).dispose();
                  },
                ),
                color: Colors.pink,
              ),
            ],
          ),
        );
      });
}
