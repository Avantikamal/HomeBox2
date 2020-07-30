import 'package:flutter/material.dart';
import 'package:homebox/Widgets/slide_list.dart';
import 'package:homebox/screens/Login_screen.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.red : Colors.red.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              slideIndex = index;
            });
          },
          children: <Widget>[
            SlideTile(
              imagePath: mySLides[0].getImageAssetPath(),
              title: mySLides[0].getTitle(),
              desc: mySLides[0].getDesc(),
            ),
            SlideTile(
              imagePath: mySLides[1].getImageAssetPath(),
              title: mySLides[1].getTitle(),
              desc: mySLides[1].getDesc(),
            ),
            SlideTile(
              imagePath: mySLides[2].getImageAssetPath(),
              title: mySLides[2].getTitle(),
              desc: mySLides[2].getDesc(),
            )
          ],
        ),
      ),
      bottomSheet: slideIndex != 2 ? Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
              splashColor: Colors.blue[50],
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              ),
            ),
        Container(
            child: Row(
              children: <Widget>[
            for(int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
              ],
       ),
    ),
    Container(
              padding: EdgeInsets.only(bottom: 3.0,right: 4.0),
      child: FloatingActionButton(
                 backgroundColor: Colors.red,
      onPressed: (){
      print("this is slideIndex: $slideIndex");
      controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
      splashColor: Colors.red,
      child: Icon(Icons.arrow_forward_ios,
      color: Colors.white,)
      ),
    ),
          ],
        ),
      ) :
    Container(
    color: Colors.white,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      SizedBox(width: 40.0,),
//      Container(
//    child: Row(
//    children: <Widget>[
//    for(int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
//    ],
//    ),
//    ),
    Container(
    padding: EdgeInsets.only(right: 12.0),
      child: FlatButton(
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(30.0)),
      color: Colors.red,
      onPressed: (){

    Navigator.push(context, MaterialPageRoute(
    builder: (context) => LoginScreen(),
    ));
//      print("this is slideIndex: $slideIndex");
//      controller.animateToPage(
//    slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
      splashColor: Colors.red,
      child: Row(
        children: <Widget>[
          Text('Get Started',style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 15.0),
      ),
          SizedBox(width: 2.0,),
          Icon(Icons.arrow_forward_ios,
          color: Colors.white,
          size: 15.0,),
        ],
      )
      ),
    ),
    ],
    ),
    )

    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(title, textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            color: Colors.red
          ),),
          SizedBox(
            height: 20,
          ),
          Text(desc, textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14))
        ],
      ),
    );
  }
}
