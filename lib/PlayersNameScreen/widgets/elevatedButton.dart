import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:uno_pocket/PlayersScreen/players_model.dart';
import '../../Screens/screens.dart';

class FieldName extends StatelessWidget{
  @override
  const FieldName({
    required this.viewModel,
    required this.isTwoPlayersMode,
    required this.player,
    super.key});

  final PlayersNameModel viewModel;
  final bool isTwoPlayersMode;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.6,
      margin: EdgeInsets.only(top: height * 0.4, left: width * 0.05, right: width * 0.05),
      child: Column(
        children: [
          // Title
            PlayerField(width: width, height: height, viewModel: viewModel, player: player,),

        ],
      ),
    );
  }
}

class PlayerField extends StatelessWidget{
  PlayerField({
    required this.height,
    required this.width,
    required this.viewModel,
    required this.player,
});

  final height;
  final width;
  final PlayersNameModel viewModel;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        // Banner
        Row(
          children: [
            const Spacer(),
            viewModel.isTwoPlayerMode && viewModel.isPlayerOneFieldComplete ? Image.asset("assets/players/player_2_name.png", width: width * 0.4 , height: height * 0.2,) : Image.asset("assets/players/player_1_name.png", width: width * 0.4 , height: height * 0.2,),
            const Spacer(),
          ],
        ),

         Container(
           height: height * 0.1,
           width: width * 0.9,
           margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: height * 0.25, bottom: height * 0.05),
           child:  ClipRRect(
             borderRadius: BorderRadius.circular(30),
             child : TextButton(
               style: TextButton.styleFrom(
                   backgroundColor: Colors.black
               ),
               onPressed: (){

                 if (viewModel.isTwoPlayerMode && viewModel.isPlayerOneFieldComplete){
                   if(viewModel.playerTwoName.text.isNotEmpty){
                     print("Player 2 :  ${viewModel.playerTwoName.text}");
                     player.pause();
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BoardView(playerOneName: viewModel.playerOneName.text, playerTwoName: viewModel.playerTwoName.text, isTwoPlayersMode: viewModel.isTwoPlayerMode, player: player, playerOneScore: 0, playerTwoScore: 0, playerOneCards: [], playerTwoCards: [], isBackup: false, currentCardColor: "", currentCardValue: "", currentCard: "", userName: viewModel.userName,)));
                     viewModel.errorMessage = "";
                     viewModel.notifyListeners();
                   } else {
                     var snack = SnackBar(content: Text("¡El nombre es obligatorio!", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),behavior:  SnackBarBehavior.floating,);
                     ScaffoldMessenger.of(context).showSnackBar(snack);
                   }

                 }

                 if (viewModel.isTwoPlayerMode && !viewModel.isPlayerOneFieldComplete){
                   if (viewModel.playerOneName.text.isNotEmpty){
                     print("Player 1 :  ${viewModel.playerOneName.text}");
                     viewModel.isPlayerOneFieldComplete = true;
                     viewModel.errorMessage = "";
                     viewModel.notifyListeners();
                   } else {
                     var snack = SnackBar(content: Text("¡El nombre es obligatorio!", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),behavior:  SnackBarBehavior.floating,);
                     ScaffoldMessenger.of(context).showSnackBar(snack);
                     viewModel.notifyListeners();
                   }

                 }

                 if (!viewModel.isTwoPlayerMode){
                   // We're playing against the CPU
                   if (viewModel.playerOneName.text.isNotEmpty){
                     viewModel.playerTwoName.text = "Roby";
                     viewModel.notifyListeners();
                     print("Player 1 : ${viewModel.playerOneName.text}");
                     print("Player 2 : ${viewModel.playerTwoName.text}");
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BoardView(playerOneName: viewModel.playerOneName.text, playerTwoName: viewModel.playerTwoName.text, playerOneScore: 0, playerTwoScore: 0, playerOneCards: [], playerTwoCards: [], isTwoPlayersMode: false, currentCard: "", currentCardColor: "", currentCardValue: "", player: player, isBackup: false, userName: viewModel.userName,)));
                   }


                 }


               },
               child: const Text("Guardar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25) ,),
             ),
           ),
         ),
      ],
    );
  }
}
