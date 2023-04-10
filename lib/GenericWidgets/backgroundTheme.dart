import 'package:flutter/material.dart';

class BackgroundTheme extends StatelessWidget{
  @override
  BackgroundTheme([this.userColor = const Color.fromRGBO(238, 34, 41, 1.0)]);

  Color userColor;

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: userColor,
      ),
    );
  }
}