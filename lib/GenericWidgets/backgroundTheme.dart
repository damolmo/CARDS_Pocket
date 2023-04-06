import 'package:flutter/material.dart';

class BackgroundTheme extends StatelessWidget{
  @override
  const BackgroundTheme({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(238, 34, 41, 1.0),
      ),
    );
  }
}