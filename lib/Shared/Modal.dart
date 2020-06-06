import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:homebox/Shared/Product.dart' as pdt;

void settingModalBottomSheet(BuildContext context, price,index) {
  showModalBottomSheet(
      elevation: 10.0,
      // barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: (MediaQuery.of(context).size.height)/1.45,
          child: new Wrap(
            children: <Widget>[
              pdt.detailsContainer(context, '$price','$index'),
              Container(
                child: ListTile(
                  leading: new Icon(Icons.add_shopping_cart),
                  title: Text(
                    'Place Order',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onTap: (){},
                ),
                color: Color(0xff61ce70),
              ),
            ],
          ),
        );
      });
}
