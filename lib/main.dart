import 'package:flutter/material.dart';
import 'Screens/screens.dart';

void main() async {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget{
  @override
  const LoginScreen({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: LoginView(),
    );
  }
}
