import 'package:homebox/models/product.dart';
import 'package:homebox/models/price.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class SubCategory{
  String image;
  String category;

static Product p=new Product();
  List<Product> products=p.products;
  SubCategory({this.image,this.category,this.products});

  void setImage(String imagePath){
    image=imagePath;
  }
  void setCategory(String Category){
    category=Category;
  }
  void setProducts(String Category){
    category=Category;
  }
  String getImage(){
    return image;

  }
  String getCategory(){
    return category;

  }
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


List<SubCategory> single(){

  List<SubCategory> single=new List<SubCategory>();

  SubCategory category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('PulsesAndBeans');
  category.setProducts('PulsesAndBeans');

  single.add(category);


  category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('Spices');
  single.add(category);


  category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('Earthen Wares');
  single.add(category);


  category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('SuperfoodProduct');
  single.add(category);

  category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('Organic Edible Oil');
  single.add(category);

  category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('HoneyAndGhee');
  single.add(category);

  category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('Sarbat');
  single.add(category);

  category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('Flour');
  single.add(category);


  category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('Cereals');
  single.add(category);

  category=new SubCategory();
  category.setImage('assets/images/category1.png');
  category.setCategory('Others');
  single.add(category);




  return single;


}