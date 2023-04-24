import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:uno_pocket/BoardScreen/board_model.dart';
import '../../Screens/screens.dart';

class CurrentCard extends StatelessWidget{

  CurrentCard({
    required this.viewModel,
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
        children : [

          InkWell(
            onTap: (){
              viewModel.pickCardFromDeck();
              if (viewModel.winnerDetected){
                viewModel.killCurrentMusic(viewModel.player);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WinnerView(winnerPlayer: viewModel.winnerName, loosePlayer: viewModel.looserName, winnerScore: viewModel.winnerScore, looserScore: viewModel.looserScore, isTwoPlayersMode: viewModel.isTwoPlayersMode, userName: viewModel.userName,)));
              }
            },
            child : Container(
              width: width * 0.4,
              height: height * 0.23,
              margin: EdgeInsets.only(top: height * 0.16, right: width * 0.1, left: width * 0.45),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(viewModel.currentCollectionDeck),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),
          ),

          DragTarget(
          builder: (
            BuildContext context,
            List<dynamic> accept,
            List<dynamic> denied) {
            return Container(
              width: width * 0.4,
              height: height * 0.25,
              margin: EdgeInsets.only(top: height * 0.15, left: width * 0.2,),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(viewModel.currentCard),
                      fit: BoxFit.fitHeight
                  )
              ),
            );
          },

            onAccept: (data){
              int index = data as int;

              var snack = SnackBar(content: Text("¡Bien hecho!", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,), behavior: SnackBarBehavior.floating);
              ScaffoldMessenger.of(context).showSnackBar(snack);
              viewModel.dropCardNotification = true;
              viewModel.notifyListeners();
              viewModel.currentNotificationTimeOut();


              if (viewModel.isCardDropped){
                viewModel.isPlayerOneTurn ? viewModel.checkUserSelectedCard(viewModel.playerOneCards[index], "launch") : viewModel.checkUserSelectedCard(viewModel.playerTwoCards[index], "launch");

              }

              if (viewModel.winnerDetected == true){
                viewModel.killCurrentMusic(viewModel.player);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WinnerView(winnerPlayer: viewModel.winnerName, loosePlayer: viewModel.looserName, winnerScore: viewModel.winnerScore, looserScore: viewModel.looserScore, isTwoPlayersMode: viewModel.isTwoPlayersMode, userName: viewModel.userName,)));
              }

            },


            onWillAccept: (data){
              int index = data as int;
              AudioPlayer dropSound = AudioPlayer();

              viewModel.isPlayerOneTurn ? viewModel.checkUserSelectedCard(viewModel.playerOneCards[index], "check") : viewModel.checkUserSelectedCard(viewModel.playerTwoCards[index], "check");

              if(viewModel.isCardDropped){
                dropSound.play(AssetSource("sounds/dropped.mp3"));
                return true;

              } else {
                return false;
              }

            },

    ),
        ]
    );
  }
}