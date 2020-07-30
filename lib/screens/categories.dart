import 'package:flutter/material.dart';
import 'package:homebox/Widgets/category.dart';
import 'package:homebox/screens/subCategory.dart';
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<Category> myCategories=new List<Category>();
  int index=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myCategories=single();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Categories',

          style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.w800,
            fontSize: 25.0
          ),),

actions: <Widget>[
  Row(
    children: <Widget>[
      CircleAvatar(),
      IconButton(icon:Icon(Icons.shopping_cart,
      color: Colors.black,))
    ],
  )
],
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
//                Container(
//                  padding: const EdgeInsets.all(8),
//                  //child: const Text("He'd have you all unravel at the"),
//                  color: Colors.green[100],
//                ),
//                Container(
//                  padding: const EdgeInsets.all(8),
//                 // child: const Text('Heed not the rabble'),
//                  color: Colors.green[200],
//                ),
//                Container(
//                  padding: const EdgeInsets.all(8),
//                 // child: const Text('Sound of screams but the'),
//                  color: Colors.green[300],
//                ),
//                Container(
//                  padding: const EdgeInsets.all(8),
//                 // child: const Text('Who scream'),
//                  color: Colors.green[400],
//                ),
//                Container(
//                  padding: const EdgeInsets.all(8),
//                  //child: const Text('Revolution is coming...'),
//                  color: Colors.green[500],
//                ),
//                Container(
//                  padding: const EdgeInsets.all(8),
//                 // child: const Text('Revolution, they...'),
//                  color: Colors.green[600],
//                ),

              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),

              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),

              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),

              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),

              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),

              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),  Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),
              Single_category(
                image: myCategories[0].getImage(),
                category: myCategories[0].getCategory(),
              ),




              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Single_category extends StatelessWidget {
  
  String image;
  String category;
  
  Single_category({this.image,this.category});
  
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Subcategory())),
      child: Column(
        children: <Widget>[
          Container(
            height: 80.0,
            width: 95.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(image: AssetImage(image),
                    fit: BoxFit.cover)
            ),
            padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 18.0),
      //child: Image.asset(image),
          ),
          SizedBox(height: 3.0,),
          Text(category),
        ],
      ),
    );
  }
}
