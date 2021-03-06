import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Product> fetchProduct() async {
  final response = await http
      .post('https://homebox-backend.herokuapp.com/api/products/', body: {'category':1, 'sub_category':2});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Product.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load products');
  }
}

class Price { //price object for Product
  final int id;
  final double price;
  final String size;
  Price({this.id, this.price, this.size});
}

class Product {
  final String title;
  final List<Price> prices;
  final int discountPrice;
  final String categoryName;
  final String subCategoryName;
  final String description;

  Product(
      {this.title,
        this.prices,
        this.discountPrice,
        this.categoryName,
        this.subCategoryName,
        this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      //  price: json['price'],
      discountPrice: json['discount_price'],
      categoryName: json['category_name'],
      subCategoryName: json['sub_category_name'],
      description: json['description'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Product>(
            future: futureProduct,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}