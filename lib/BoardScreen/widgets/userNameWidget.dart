import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class UserNameWidget extends StatelessWidget{
  const UserNameWidget({
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
      margin: EdgeInsets.only( left: width * 0.1, right: width * 0.1),
      child: viewModel.isTwoPlayersMode && viewModel.isPlayerOneTurn ?  Text("${viewModel.playerOneName}", style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold), textAlign: TextAlign.center,) :  Text("${viewModel.playerTwoName}",  style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
    );
  }
}