import 'package:flutter/material.dart';

class WinnerMessage extends StatelessWidget{
  const WinnerMessage({super.key});

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(top: height * 0.1, left: width * 0.3, right: width * 0.3),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/winners/winner.png"),
          fit: BoxFit.fitWidth
        )
      ),
    );
  }
}