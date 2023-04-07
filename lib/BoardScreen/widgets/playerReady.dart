import 'package:flutter/material.dart';
import 'package:uno_pocket/BoardScreen/board_model.dart';

class PlayerReady extends StatelessWidget{
  const PlayerReady({
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
      height: double.maxFinite,
      margin: EdgeInsets.only(top: height * 0.1, bottom: height * 0.1, left: width * 0.1, right: width * 0.1),
      child: Column(
        children: [
          // Current Player Name
          NextPlayerName(viewModel: viewModel),

          // Message
          UserMessage(),

          // Start Turn Button
          StartButton(viewModel: viewModel),
        ],
      ),
    );
  }
}

class NextPlayerName extends StatelessWidget{
  const NextPlayerName({
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
      height: height * 0.1,
      margin: EdgeInsets.only(),
      child: viewModel.isPlayerOneTurn ? Text(viewModel.playerOneName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50), textAlign: TextAlign.center,) :  Text(viewModel.playerTwoName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50), textAlign: TextAlign.center,),
    );
  }
}

class UserMessage extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
      child: Text("Es tu turno", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
    );
  }
}

class StartButton extends StatelessWidget{
  const StartButton({
    required this.viewModel,
    super.key,
});

  final BoardModel viewModel;


  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (){
        viewModel.newTurnButton = false;
        viewModel.youAreFired();
        viewModel.notifyListeners();
      },
        child : Container(
          width: 200,
          height: 200,
          margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: viewModel.isPlayerOneTurn ? Colors.redAccent :  Colors.blueAccent
          ),
          child: Column(
            children  : const [
              const Spacer(),
              Text("Empezar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30), textAlign: TextAlign.center,),
              const Spacer(),
            ],
          ),
        ),
    );
  }
}