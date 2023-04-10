import 'package:flutter/material.dart';
import 'package:uno_pocket/BoardScreen/board_model.dart';

class Buttons extends StatelessWidget{
  const Buttons({
    required this.viewModel,
    super.key
  });

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){
    
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    
    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(top: height * 0.35, left: width * 0.025, right: width * 0.025),
      child: Row(
        children: [
          // UNO Button
          InkWell(
            onTap : (){
              viewModel.checkUnoChance();
             },
            child : Image.asset(viewModel.isPlayerOneTurn ? "assets/buttons/UNO.png" :  "assets/buttons/UNO_blue.png", width: width * 0.2, height: height * 0.2,)),
          SizedBox(width: width * 0.55,),
          InkWell(
            onTap: (){
             viewModel.userLaunched = true;
             viewModel.notifyListeners();
            },
            child : Image.asset(viewModel.isPlayerOneTurn ? "assets/buttons/next_turn.png" :  "assets/buttons/next_turn_blue.png", width: width * 0.2, height: height * 0.2,)),
        ],
      ),
    );
  }
}