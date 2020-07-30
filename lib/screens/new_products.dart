import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:homebox/models/product.dart';
import 'package:homebox/screens/new_product_details.dart';
import 'package:homebox/models/price.dart';


class Products extends StatefulWidget {

String category_name;
List<Product> products;
Products({this.category_name,this.products});


  @override
  _ProductsState createState() => _ProductsState();
}



class _ProductsState extends State<Products> {


List<Product> products=[];


Future<void> getProducts(String _category) async {

  // token variable has not taken into consideration for now
  // Gets the raw data fron back end API
  http.Response response = await http.get(Uri.encodeFull(
      "http://homebox-backend.herokuapp.com/api/products/?category=$_category"));
  // Prints the JSON object of the products with the specified category
  var jsonData = jsonDecode(response.body);
  print(response.body);

  jsonData.forEach((element){
    List<Price> prices = [];
    element['price'].forEach((ele){

      Price price = Price(
          price: ele['price'],
          wt: ele['size']);
      prices.add(price);
    });
    Product product = Product(
        title: element['title'],
        categoryName: element['category_name'],
        prices: prices);
    products.add(product);
  });
}
  @override
  void initState() {
    // TODO: implement initState
    getProducts(widget.category_name);

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         elevation: 0.0,
         backgroundColor: Colors.white,
         title: Text(widget.category_name,
         ),
         leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed:()=> Navigator.pop(context)),
       ),
        body: ListView.builder(
          
            itemCount: products.length,
            itemBuilder: (BuildContext context,index)=>
                GestureDetector(
//                  onTap: ()=>
//                  Navigator.push(context, MaterialPageRoute(builder:
//                      (context)=>New_productDetails(image: products[index].image,
//                      title: products[index].title,
//                          price: products[index].price,
//                     // wt:
//                      description: products[index].description,))),
                  child: Container(
                    padding: EdgeInsets.only(top: 15.0),
                    color: Colors.red.shade50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Stack(
                                children: <Widget>[
                                  Container(
                                      height: 90,
                                      width: 120,
                                      color: Colors.white,
                                      child:  Image.asset('assets/images/p1.jpg')

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
                                    text: '${products[index].title.split(' ')[0]} ',
                                    style: TextStyle(
                                        color: Color(0xff676767),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  TextSpan(
                                    text: products[index].title.substring(
                                        products[index].title.split(' ')[0].length + 1,
                                        products[index].title.length),
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
                                   "Rs. "+ products[index].prices[index].price.toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 37,
                            ),
                            Divider(
                              // indent: 150.0,
                              color: Colors.grey.shade400,
                              height: 1.0,
                            )
                          ],
                        )
                        )
                      ],
                    ),
                  ),
                ),
        )
    );

  }





}
