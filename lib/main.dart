import 'package:flutter/material.dart';
import 'Screens/screens.dart';

Future<String> getLogin() async {
  var userID = await CheckCurrentLogin.retrieveCurrentLogin();
  return userID;
}

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
