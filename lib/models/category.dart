import 'package:homebox/models/sub_category.dart';

class Category {
  final String name;
  final String image;
 List<SubCategory> sub_category;


  Category({this.name, this.image,this.sub_category});
}
