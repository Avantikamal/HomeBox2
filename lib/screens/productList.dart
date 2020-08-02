import 'package:flutter/material.dart';
import 'package:homebox/Widgets/product_container.dart';
import 'package:homebox/integration/Integration.dart';
import 'package:homebox/integration/product_info.dart';
import 'package:homebox/screens/product_details.dart';

class SingleProduct extends StatefulWidget {
  // container diplaying one single product
  Product product;
  SingleProduct({this.product});
  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  Product product;
  String selectedSize; // selected size from the drop down menu
  int selectedPriceIndex = 0;
  @override
  void initState() {
    super.initState();
    product = widget.product;
    if (product.prices.length != 0) {
      selectedSize = product.prices[0].size;
    } else {
      selectedSize = "unavailable"; // null if prices is empty
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
//      borderRadius:
//      BorderRadius.all(Radius.circular(15.0)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 53.0, //changed to 80->74 to avoid render flex error
              child: Image.asset(
                'assets/images/organic-food.png',
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 1.0,
          ),
          Text(
            product.title,
            style: TextStyle(color: Colors.black),
            textScaleFactor: 0.8,
          ),
          SizedBox(
            height: 0.0,
          ),
          DropdownButton(
            value: selectedSize,
            onChanged: (string) {
              setState(() {
                selectedSize = string;
              });
            },
            items: product.prices == null
                ? <Widget>[
              Text(
                "unavailable",
                textScaleFactor: 1,
              ),
            ]
                : List.generate(product.prices.length, (index) {
              return DropdownMenuItem<String>(
                onTap: () {
                  setState(() {
                    selectedPriceIndex = index;
                  });
                },
                value: product.prices[index].size,
                child: Text(
                  product.prices[index].size,
                  textScaleFactor: 1,
                ),
              );
            }),
          ),
          // Text(
          //   '500 g,',
          //   style: TextStyle(color: Colors.grey.shade400),
          // ),
          SizedBox(
            height: 1.0,
          ),
          Row(
            children: <Widget>[
              Text(product.prices.length==0?"unavailable":"Rs." + product.prices[selectedPriceIndex].price.toString(),
                  style: TextStyle(color: Colors.black), textScaleFactor: 0.8),
              SizedBox(
                width: 80.0,
              ),
              InkWell(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  Products products; // products of specific category
  ProductList({this.products});
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Products products;
  @override
  void initState() {
    super.initState();
    products = widget.products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
//      appBar: AppBar(
//
//
//        title: Text('Fruits',style: TextStyle(
//          fontSize: 25.0,
//          fontFamily: 'Poppins',
//            fontWeight: FontWeight.w500
//        ),),
//        actions: <Widget>[
//          Row(
//            children: <Widget>[
//              Icon(Icons.search,color: Colors.black,),
//              SizedBox(width: 10.0,),
//              Icon(Icons.shopping_cart,color: Colors.black,),
//              SizedBox(width: 5.0),
//            ],
//          )
//        ],
//      ),
        body: CustomScrollView(
          shrinkWrap: true,
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  children: List.generate(products.products.length, (index) {
                    //iterate through each product and pass it to single_product()
                    return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(//pass a product to display product details
                          //         builder: (context) => Product_details(product:products.products[index])));
                        },
                        child: SingleProduct(
                            product: products.products[
                            index])); //widget for a product with name,size,price and add to cart option
                  })),
            ),
          ],
        ));
  }
}