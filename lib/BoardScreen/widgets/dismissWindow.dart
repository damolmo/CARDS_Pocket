import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class DismissWindows extends StatelessWidget{
  @override
  DismissWindows({
    required this.viewModel,
    required this.player,
    super.key,
});

  final BoardModel viewModel;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context){
    return Stack(
        children: [
          // Background Theme
          viewModel.isPlayerOneTurn ? BackgroundTheme() :  BackgroundTheme(const Color.fromRGBO(9, 86, 191, 1.0)),

          // Warning Banner
          WarningBanner(),

          // Interactive Buttons
          ListView(
            children: [
              InteractiveButtons(viewModel: viewModel, player: player,),
            ],
          )
        ],
    );
  }
}

class WarningBanner extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(top: height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // First Part
          Image.asset("assets/warnings/dismiss_1.png",fit: BoxFit.fitWidth,),

          // Second Part
          Image.asset("assets/warnings/dismiss_2.png",fit: BoxFit.fitWidth,),

        ],
      ),
    );
  }
}

class InteractiveButtons extends StatelessWidget{
  @override
  InteractiveButtons({
    required this.viewModel,
    required this.player,
    super.key,
});

  final BoardModel viewModel;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.maxFinite,
      height:  height * 0.4,
      margin: EdgeInsets.only(top : height * 0.35, left: width * 0.1, right: width * 0.1),
      child: Column(
        children: [
          // Proceed Button
          Container(
            width: double.maxFinite,
            height: height * 0.15,
            margin: EdgeInsets.only(bottom: height * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.greenAccent
                ),
                onPressed: (){
                  player.stop();
                  viewModel.killCurrentMusic(player);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TitleView()));
                },
                child: const Text("Aceptar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35), textAlign: TextAlign.center,),
            ),
            ),
          ),

          Container(
            width: double.maxFinite,
            height: height * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.redAccent
                ),
                onPressed: (){
                  viewModel.userDismised = false;
                  viewModel.notifyListeners();
                },
                child: const Text("Cancelar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35), textAlign: TextAlign.center,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}