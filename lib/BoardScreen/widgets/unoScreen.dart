import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class UnoScreen extends StatelessWidget{
  @override
  UnoScreen({
    required this.viewModel,
    super.key,
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          BackgroundTheme(),

          // Uno Message
          UnoMessage(),

          // Uno Message 2
          UnoMessage2(viewModel: viewModel),

          // Uno Button
          UnoButton(viewModel: viewModel),
        ],
      ),
    );
  }
}

class UnoMessage extends StatelessWidget{
  @override
  UnoMessage({
    super.key
});

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(top: height * 0.1, left: width * 0.1, right: width * 0.1, bottom: height * 0.2),
      child: Column(
        children: [
          // Title
          Image.asset("assets/unoChance/unoChance.png", width: double.maxFinite, height: height * 0.1,),
          Image.asset("assets/unoChance/unoChance_2.png", width: double.maxFinite, height: height * 0.1,),

          // Subtitle
        ],
      ),
    );
  }
}

class UnoMessage2 extends StatelessWidget{
  @override
  const UnoMessage2({
    required this.viewModel,
    super.key});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.1,
      margin: EdgeInsets.only(top: height * 0.5 ,bottom: height * 0.1, right: width * 0.1, left: width * 0.1),
      child: Text("${viewModel.playerUnoEventName}, robas ${viewModel.unoEventAmount} cartas ", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
    );
  }
}

class UnoButton extends StatelessWidget{
  @override
  UnoButton({
    required this.viewModel,
    super.key
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(top: height * 0.7, left: width * 0.1, right: width * 0.1, bottom: height * 0.1) ,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child : TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.greenAccent
          ),
          onPressed : (){
            viewModel.playerUnoEventName = "";
            viewModel.unoEventAmount = 0;
            viewModel.unoEvent = false;
            viewModel.userLaunched = true;
            viewModel.notifyListeners();
          },
          child: Text("Continuar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25) ,),

        ),
      ),
    );
  }
}