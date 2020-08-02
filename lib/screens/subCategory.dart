import 'package:flutter/material.dart';

import 'package:homebox/integration/Integration.dart';


import 'package:homebox/screens/products_screen.dart';


class Subcategory extends StatefulWidget {
  @override
  _SubcategoryState createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  List<String> categoryList = [
    //hard coded category list
    "Cereals",
    "Flour",
    "Sarbat",
    "HoneyAndGhee",
    "Organic Edible Oil",
    "SuperfoodProduct",
    "Earthen Wares",
    "Spices",
    "PulsesAndBeans",
    "Others"
  ];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Categories',style: TextStyle(color: Colors.black87),),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: CustomScrollView(primary: false, slivers: <Widget>[
        SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
                crossAxisSpacing: 7,
                mainAxisSpacing: 27,
                crossAxisCount: 2,
                children: List.generate(categoryList.length, (index) {
                  return Single_Subcategory(
                    category: categoryList[index],
                  );
                })))
      ]),
    );
  }
}

class Single_Subcategory extends StatefulWidget {
  String category;

  Single_Subcategory({this.category});

  @override
  _Single_SubcategoryState createState() => _Single_SubcategoryState();
}

class _Single_SubcategoryState extends State<Single_Subcategory> {
  String category;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.category=widget.category;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () async {
          Products products = Products();
          await products.getProducts(widget.category); //get products as per category
          return Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Products_scrren(// navigate to product screen with list of products
                    products: products,
                  )));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              Container(
                height: 160.0,
                width: 170.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/category1.png'),
                        fit: BoxFit.fill)),

                //child: Image.asset(image),
              ),
              SizedBox(
                height: 1.0,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.category,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}