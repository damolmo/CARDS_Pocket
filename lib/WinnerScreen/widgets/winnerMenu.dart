import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class WinnerMenu extends StatelessWidget{
  @override
  const WinnerMenu({
    required this.viewModel,
    super.key});

  final WinnerModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.4,
      margin: EdgeInsets.only(top: height * 0.6, left: width * 0.1, right: width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Try again
          Container(
            width: double.maxFinite,
            height: height * 0.15,
            margin: EdgeInsets.only(bottom: height * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: (){
                  viewModel.player.stop();
                  viewModel.addWinnerToRanking();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BoardView(playerOneName: viewModel.winnerName, playerTwoName: viewModel.looseName, isTwoPlayersMode: viewModel.isTwoPlayersMode, player: viewModel.player, playerOneScore: 0, playerOneCards: [], playerTwoCards: [], playerTwoScore: 0, isBackup: false, currentCardColor: "", currentCard: "", currentCardValue: "",)));
                },
                child: const Text("Volver a jugar", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
              ),
            ),
          ),

          // Return Home
          Container(
            width: double.maxFinite,
            height: height * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: (){
                  viewModel.player.stop();
                  viewModel.addWinnerToRanking();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TitleView()));
                },
                child: const Text("Inicio", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
              ),
            ),
          ),

          SizedBox(height: height * 0.05,),
          // Return Home
        ],
      ),
    );
  }
}