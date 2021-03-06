import 'package:homebox/integration/auto_login.dart';
import 'package:homebox/integration/product_info.dart';
import 'package:http/http.dart' as http;
//import 'package:HomeBox2/models/products.dart';
import 'dart:async';
import 'dart:convert';

var auth_token = null;
bool loggedIn = false;
var otp = null;

class Otpservice {
  Future<String> otpGenerate(String _phone) async {
    // Gets the response from the API
    var url = 'http://homebox-backend.herokuapp.com/api/otp/generate/';
    http.Response response = await http.post(url, body: {'mobile': _phone});
    // Converts the raw response into useful object
    Map mymap = json.decode(response.body);
    if (mymap['success']) {
      print("OTP has been sent to your mobile number.");
    }
    // Return statement is optional
    return (response.body);
  }

  Future<String> otpVerify(var _phone, var _otp) async {
    // Gets the respose from the API
    var url = 'http://homebox-backend.herokuapp.com/api/otp/verify/';
    http.Response response =
    await http.post(url, body: {'mobile': _phone, 'otp': _otp});
    // Converting the raw response into useful object
    Map mymap = json.decode(response.body);
    if (mymap['success']) {
      auth_token = mymap['auth_token'];
      loggedIn = true;
      print("You are logged in !");
      return auth_token;
    } else {
      print(mymap["message"]);
    }
  }
}

Future<String> logout(var _token) async {
  // Gets the operation status from the API
  var url = 'http://homebox-backend.herokuapp.com/api/logout/';
  http.Response response = await http.get(url, headers: {'Token': _token});
  // Map converts the raw JSON into a usable object
  Map mymap = json.decode(response.body);
  if (mymap['success']) {
    TokenService().removeLogInToken(_token);
    loggedIn = false;
    print('You have been successfully logged out!');
  }
}

class Products {
  List<Product> products = [];

  Future<void> getProducts(String _category) async {
    // token variable has not taken into consideration for now
    // Gets the raw data fron back end API
    http.Response response = await http.get(Uri.encodeFull(
        "http://homebox-backend.herokuapp.com/api/products/?category=$_category"));
    // Prints the JSON object of the products with the specified category
    List<dynamic> jsonData =
    jsonDecode(response.body); //json object in list form

    jsonData.forEach((element) {
      //iterate through each product in json object
      List<Price> prices = [];
      element['price'].forEach((ele) {
        // iterate throught each price in a product
        Price price = Price(price: ele['price'], size: ele['size']);
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

void main() {
  var phone = "";
  var otp = "";
  // otpGenerate(phone);
  // otpVerify(phone,otp);

  // logout('a59cd28d681d1286287790636d76822da84813f5');
  // getProducts(auth_token, true, 'Flour');
}