import 'package:flutter/material.dart';

class ClassificationBanner extends StatelessWidget{
  @override
  const ClassificationBanner({super.key});

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.3,
      margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
      child: Stack(
        children: [

          // Left
          // Brand logo
          Container(
            width: double.maxFinite,
            height: height * 0.3,
            margin: EdgeInsets.only(top: height * 0.05, right: width * 0.55),
            child: Image.asset("assets/logo/logo.png", height: height * 0.01, width: width * 0.3,),
          ),

          // Centered
          // Classification Title
          Container(
            width: double.maxFinite,
            height: height * 0.3,
            margin: EdgeInsets.only(top: height * 0.05, left: width * 0.4, right: width * 0.05),
            child: Image.asset("assets/classification/classification.png", width: width * 0.45,),
          )



        ],
      ),
    );
  }

}