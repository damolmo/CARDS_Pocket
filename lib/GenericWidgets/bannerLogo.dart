import 'package:flutter/material.dart';

class BannerLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.3,
      margin: EdgeInsets.only(top: height * 0.1, left: width * 0.1, right: width * 0.1 ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/logo/logo.png"),
          fit: BoxFit.fitHeight
        )
      ),
    );
  }
}