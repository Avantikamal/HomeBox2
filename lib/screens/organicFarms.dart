import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class OrganicFarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12.0)),
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          depth: 10.0,
          lightSource: LightSource.topLeft,
          color: Theme.of(context).primaryColor,
          border: NeumorphicBorder(
            color: Color(0x33000000),
            width: 0.8,
          )),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey.shade100,
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 5.0,
              centerTitle: true,
              title: Text(
                'ORGANICO',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              child: Center(
                  child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/empty.png",
                    width: MediaQuery.of(context).size.width - 100,
                  ),
                  Text(
                    "Coming Soon.....",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.amber,
                        fontFamily: "Poppins"),
                  )
                ],
              )),
            )),
      ),
    );
  }
}
