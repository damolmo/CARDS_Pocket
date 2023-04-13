import 'package:flutter/material.dart';
import 'Screens/screens.dart';

void main(){
  runApp(const
  MaterialGame());
}

class MaterialGame extends StatelessWidget{
  @override
  const MaterialGame({super.key});

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      home: TitleView(),
      initialRoute: "login",
      routes: {
      "login" : (_) => LoginView(),
      "title" : (_) => TitleView(),
      }
      );
  }
}