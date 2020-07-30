import 'package:homebox/models/price.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
class Product {
  final String title;
  final int price;
  final int discountPrice;
  final String categoryName;
  List<Price> prices;
  final String description;
  final String image;


  Product({this.title,
    this.price,
    this.discountPrice,
    this.categoryName,
   this.prices,
    this.description,
  this.image,
  });

  List<Product> products;
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



}





