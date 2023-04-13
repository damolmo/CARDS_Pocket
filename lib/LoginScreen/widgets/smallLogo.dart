import 'package:flutter/material.dart';

class SmallLogo extends StatelessWidget{
  @override
  const SmallLogo({super.key});

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.15,
      margin: EdgeInsets.only(top: height * 0.075, bottom: height * 0.05, left: width * 0.3, right: width * 0.3),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/logo/logo.png"),
          fit: BoxFit.fitHeight
        )
      ),
    );
  }
}