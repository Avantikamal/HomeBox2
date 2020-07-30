import 'package:flutter/material.dart';
import 'package:homebox/Widgets/sub_category.dart';
import 'package:homebox/screens/new_products.dart';
import 'package:homebox/models/product.dart';
import 'package:homebox/models/price.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Subcategory extends StatefulWidget {
  @override
  _SubcategoryState createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {


  List<SubCategory> mySubCategories=new List<SubCategory>();
  List<Product> products=[];
  int index=0;
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
    mySubCategories=single();
getProducts(mySubCategories[index].category);
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
        title: Text('Categories'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: ()=>Navigator.pop(context)),
      ),
body: CustomScrollView(
    primary: false,
    slivers: <Widget>[
SliverPadding(
padding: const EdgeInsets.all(20),
sliver: SliverGrid.count(
  crossAxisSpacing: 7,
  mainAxisSpacing: 27,
  crossAxisCount: 2,
  children: <Widget>[

    Single_Subcategory(
      image: mySubCategories[0].getImage(),
      category: mySubCategories[0].getCategory(),
      //products: mySubCategories[1].getProduct(),
    ),



    Single_Subcategory(
      image: mySubCategories[1].getImage(),
      category: mySubCategories[1].getCategory(),
     // products: mySubCategories[1].getProduct(),
    ),

    Single_Subcategory(
      image: mySubCategories[2].getImage(),
      category: mySubCategories[2].getCategory(),
     // products: mySubCategories[2].getProduct(),
    ),

    Single_Subcategory(
      image: mySubCategories[3].getImage(),
      category: mySubCategories[3].getCategory(),
    //  products: mySubCategories[3].getProduct(),
    ),

    Single_Subcategory(
      image: mySubCategories[4].getImage(),
      category: mySubCategories[4].getCategory(),
     // products: mySubCategories[4].getProduct(),
    ),
    Single_Subcategory(
      image: mySubCategories[5].getImage(),
      category: mySubCategories[5].getCategory(),
     // products: mySubCategories[5].getProduct(),
    ),
    Single_Subcategory(
      image: mySubCategories[6].getImage(),
      category: mySubCategories[6].getCategory(),
    //  products: mySubCategories[6].getProduct(),
    ),
    Single_Subcategory(
      image: mySubCategories[7].getImage(),
      category: mySubCategories[7].getCategory(),
      //products: mySubCategories[7].getProduct(),
    ),
    Single_Subcategory(
      image: mySubCategories[8].getImage(),
      category: mySubCategories[8].getCategory(),
     // products: mySubCategories[8].getProduct(),
    ),
    Single_Subcategory(
      image: mySubCategories[9].getImage(),
      category: mySubCategories[9].getCategory(),
      //products: mySubCategories[9].getProduct(),
    ),
//    Single_Subcategory(
//      image: mySubCategories[10].getImage(),
//      category: mySubCategories[10].getCategory(),
//      products: mySubCategories[10].getProduct(),
//    ),

  ]
)
)
      ]
),

    );
  }
}

class Single_Subcategory extends StatelessWidget {

  String image;
   String category;


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


int index=0;
  Single_Subcategory({this.image,this.category});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Products(category_name: category,products: products,))),
//      onTap: () =>
//          Navigator.push(context, MaterialPageRoute(
//              builder: (context) => Product_details())),
      child: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            width: 170.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(image: AssetImage(image),
                    fit: BoxFit.cover)
            ),
            padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 18.0),
            //child: Image.asset(image),
          ),
          SizedBox(height: 1.0,),
          Text(category),
        ],
      ),
    );
  }
}
