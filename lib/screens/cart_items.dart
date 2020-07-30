class cart_item{
  String title;
 String wt;
  String price;
  String image;


  cart_item({this.title,this.wt,this.price,this.image});


}



class cart_itemList{
static  List<cart_item> getItems()

  {
    return[

  cart_item(
  title: 'Fresh Banana',
  wt: '1kg',
  price: 'Rs.120',
  image: "assets/images/p3.jpg",
      ),
  cart_item(
  title: 'Fresh Banana',
  wt: '1kg',
  price: 'Rs.120',
  image: "assets/images/p3.jpg",
  ),
  cart_item(
  title: 'Fresh Banana',
  wt: '1kg',
  price: 'Rs.120',
  image: "assets/images/p3.jpg",
  ),
  cart_item(
  title: 'Fresh Banana',
  wt: '1kg',
  price: 'Rs.120',
  image: "assets/images/p3.jpg",
  ),cart_item(
  title: 'Fresh Banana',
  wt: '1kg',
  price: 'Rs.120',
  image: "assets/images/p3.jpg",
  ),
  cart_item(
  title: 'Fresh Banana',
  wt: '1kg',
  price: 'Rs.120',
  image: "assets/images/p3.jpg",
  ),

  ];
}
}