import 'package:flutter/material.dart';
import 'package:homebox/models/category.dart';
import 'package:homebox/screens/new_subcategory.dart';
class New_Category extends StatefulWidget {
  @override
  _New_CategoryState createState() => _New_CategoryState();
}

class _New_CategoryState extends State<New_Category> {
  List<Category> category;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Categories'),
      ),
      body: ListView.builder(
          itemCount:category.length,
          itemBuilder: (BuildContext context,index)=>
              InkWell(
//                onTap: ()=> Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => New_SubCategory(subCat: category[index].sub_category,))),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 80.0,
                      width: 95.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(image: AssetImage(category[index].image),
                              fit: BoxFit.cover)
                      ),
                      padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 18.0),
                      //child: Image.asset(image),
                    ),
                    SizedBox(height: 3.0,),
                    Text(category[index].name),
                  ],
                ),
              )
     )
      );

  }
}
