import 'package:flutter/material.dart';
import 'package:uno_pocket/BoardScreen/board_model.dart';

class UserScore extends StatelessWidget{
  @override
  const UserScore({
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
      margin: EdgeInsets.only(top: height * 0.43, left: width * 0.25, right: width * 0.25),
      child: Column(
        children: [
          // Title
          const Text("Puntuación", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          Text(viewModel.isPlayerOneTurn ?  viewModel.playerOneScore.toString() :  viewModel.playerTwoScore.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}