import 'package:flutter/material.dart';
import 'package:homebox/integration/Integration.dart';

import 'package:homebox/screens/productList.dart';

class Products_scrren extends StatefulWidget {
  Products products;
  Products_scrren({this.products});
  @override
  _Products_scrrenState createState() => _Products_scrrenState();
}

class _Products_scrrenState extends State<Products_scrren>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  Products products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = widget.products;
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Row(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                Spacer(),
                Text(products.products[0].categoryName,
                    style: TextStyle(color: Colors.black,)),
                Spacer(),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Search here",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'OpenSans'),
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // TabBar(
          //     controller: tabController,
          //     indicatorColor: Colors.green,
          //     indicatorWeight: 3.0,
          //     labelColor: Colors.black,
          //     unselectedLabelColor: Colors.grey,
          //     isScrollable: true,
          //     tabs: <Widget>[
          //       Tab(
          //         child: Text(
          //           "Fruits",
          //           style: TextStyle(fontSize: 20.0),
          //         ),
          //       ),
          //       Tab(
          //         child: Text(
          //           "Vegetables",
          //           style: TextStyle(fontSize: 20.0, fontFamily: 'OpenSans'),
          //         ),
          //       ),
          //       Tab(
          //         child: Text(
          //           "Nuts & Seeds",
          //           style: TextStyle(fontSize: 20.0, fontFamily: 'OpenSans'),
          //         ),
          //       ),
          //       Tab(
          //         child: Text(
          //           "Dairy",
          //           style: TextStyle(fontSize: 20.0, fontFamily: 'OpenSans'),
          //         ),
          //       ),
          //     ]),
          Expanded(
            child: Container(
              child: ProductList(
                products: products,
              ), //grid list of products
            ),
          )
        ],
      ),
    );
  }
}