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

          Container(
            width: width * 0.4,
            height: height * 0.25,
            margin: EdgeInsets.only(top: height * 0.15, left: width * 0.2,),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(viewModel.currentCard),
                    fit: BoxFit.fitHeight
                )
            ),
          ),
        ]
    );
  }
}