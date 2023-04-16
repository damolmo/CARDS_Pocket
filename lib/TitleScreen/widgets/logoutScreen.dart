import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class LogoutScreen extends StatelessWidget{
  @override
  const LogoutScreen({
    required this.viewModel,
    super.key});

  final TitleModel viewModel;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          BackgroundTheme(),

          // Title
          const LogoutTitle(),

          // Menu
          LogoutMenu(viewModel: viewModel,),


        ],
      ),
    );
  }
}

class LogoutTitle extends StatelessWidget{
  @override
  const LogoutTitle({super.key});

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return Container(
      width: double.maxFinite,
      height: height * 0.3,
      margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/logout/logout.png"),
          fit: BoxFit.fitWidth
        )
      ),
    );
  }
}

class LogoutMenu extends StatelessWidget{
  @override
  const LogoutMenu({
    required this.viewModel,
    super.key});

  final TitleModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.4,
      margin: EdgeInsets.only(top: height * 0.3, bottom: height * 0.1, left: width * 0.2, right: width * 0.2),
      child: Column(
        children: [
          // Button 1
          Container(
            width: double.maxFinite,
            height: height * 0.17,
            margin: EdgeInsets.only(bottom: height * 0.03),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : TextButton(
                onPressed : (){
                  CheckCurrentLogin.deleteCurrentLogin(viewModel.userName);
                  viewModel.player.pause();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginView()));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: const Text("Aceptar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
              ),
            ),
          ),

          // Button 2
          Container(
            width: double.maxFinite,
            height: height * 0.17,
            margin: EdgeInsets.only(top: height * 0.03),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : TextButton(
                onPressed : (){
                  viewModel.logoutScreen = false;
                  viewModel.notifyListeners();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent
                ),
                child: const Text("Cancelar", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
            ),
          )
        ],
      ),
    );
  }
}