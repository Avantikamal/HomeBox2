import 'package:flutter/material.dart';

class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Our store is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins");
  sliderModel.setTitle("100% Organic & Natural Grocery");
  sliderModel.setImageAssetPath("assets/images/onboarding13.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("You can opt for cashless payment which is secured & authenticated");
  sliderModel.setTitle("Secure Payment System");
  sliderModel.setImageAssetPath("assets/images/onboarding21.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("You will be receiving fully customized & contactless delivery ");
  sliderModel.setTitle("Quick & Safe Delivery ");
  sliderModel.setImageAssetPath("assets/images/onboarding3.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}

//class Slide {
//  String imageUrl;
//   String title;
//   String description;
//
//  Slide({
//    @required this.imageUrl,
//    @required this.title,
//    @required this.description,
//  });
//
//  void setImage(String getimage){
//    imageUrl=getimage;
//  }
//
//
//  void setTitle(String gettitle){
//    title=gettitle;
//  }
//  void setDes(String getdes){
//    description=getdes;
//  }
//
//  String getImage(){
//    return imageUrl;
//  }
//  String getTile(){
//    return title;
//  }
//  String getDes(String getdes){
//    return description;
//  }
//}
//
//List<Slide> getList(){
//
//  List<Slide> slides = new List<Slider>();
//  Slide Slide = new Slider();
//
//  //1
//  Slide.setDesc("Discover Restaurants offering the best fast food food near you on Foodwa");
//  Slide.setTitle("Search");
//  Slide.setImageAssetPath("assets/illustration.png");
//  slides.add(Slide);
//
//  Slide = new Slide();
//
//  //2
//  Slide.setDesc("Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins");
//  Slide.setTitle("Order");
//  Slide.setImageAssetPath("assets/illustration2.png");
//  slides.add(Slide);
//
//  Slide = new SliderModel();
//
//  //3
//  Slide.setDesc("Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.");
//  Slide.setTitle("Eat");
//  Slide.setImageAssetPath("assets/illustration3.png");
//  slides.add(Slide);
//
//  Slide = new SliderModel();
//
//  return slides;
//
//
////  List<Slide> slideList = [
////    Slide(
////      imageUrl: 'assets/images/organic-food.png',
////      title: "ORGANICO",
////      description: '''
////HomeBox introduces ORGANICO.
////Now Get your Organic items
////delivered at your doorstep.
////Eat Organic, Stay Healthy.''',
////    ),
////    Slide(
////      imageUrl: "assets/logo/food.png",
////      title: "Order from your Home",
////      description: "Content",
////    ),
////    Slide(
////      imageUrl: 'assets/logo/food.png',
////      title: "NearBy Vendors",
////      description: "Content",
////    ),
////    Slide(
////      imageUrl: "assets/logo/delivery.png",
////      title: "Delivery at your Doorstep",
////      description: "Content",
////    ),
////
////  ];
//}
