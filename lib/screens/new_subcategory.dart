import 'package:flutter/material.dart';
import 'package:homebox/models/sub_category.dart';
import 'package:homebox/models/product.dart';
import 'package:homebox/screens/new_products.dart';
 class New_SubCategory extends StatefulWidget {

   List<SubCategory> subCat=[];



  @override
  _New_SubCategoryState createState() => _New_SubCategoryState();
}

class _New_SubCategoryState extends State<New_SubCategory> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('Categories'),
  centerTitle: true,
  leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:()=> Navigator.pop(context)),
),
        body: ListView.builder(
            itemCount:widget.subCat.length,
            itemBuilder: (BuildContext context,index)=>
                InkWell(
//                  onTap: ()=> Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => Products(products: widget.subCat[index].product,))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80.0,
                        width: 95.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(image: AssetImage(widget.subCat[index].image),
                                fit: BoxFit.cover)
                        ),
                        padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 18.0),
                        //child: Image.asset(image),
                      ),
                      SizedBox(height: 3.0,),
                      Text(widget.subCat[index].name),
                    ],
                  ),
                )
        )
    );

  }
}
