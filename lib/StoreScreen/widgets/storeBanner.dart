import 'package:flutter/material.dart';

class StoreBanner extends StatelessWidget{
  @override
  const StoreBanner({super.key});

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.3,
      margin: EdgeInsets.only(top: height * 0.05, left: width * 0.05, right: width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(0.8),
      ),
      child: Row(
        children: [
          // Left - Logo
          Container(
            width: width * 0.4,
            height: height * 0.3,
            child: Image.asset("assets/logo/logo.png", fit: BoxFit.fitWidth,),
          ),
          
          // Right - Title
          Container(
            width: width * 0.30,
            height: height * 0.3,
            margin: EdgeInsets.only(right: width * 0.1),
            child: Image.asset("assets/store/store.png", fit: BoxFit.fitWidth,),
          ),
        ],
      ),
    );
  }
}