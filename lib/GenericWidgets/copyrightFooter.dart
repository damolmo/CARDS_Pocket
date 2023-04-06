import 'package:flutter/material.dart';

class CopyrightFooter extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.maxFinite,
      height: height * 0.1 ,
      margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top: height * 0.9, bottom: height * 0.05),
      child: const Text("©1980-2023 Mattel | ©2023 daviiid99", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
    );
  }
}