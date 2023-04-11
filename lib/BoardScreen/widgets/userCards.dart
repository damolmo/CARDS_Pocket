import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class UserCards extends StatelessWidget{
  const UserCards({
    required this.viewModel,
    super.key,
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.35 ,
      margin: EdgeInsets.only(top: height * 0.53),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(right: width / 2),
          itemCount: viewModel.isPlayerOneTurn ? viewModel.playerOneCards.length :  viewModel.playerTwoCards.length ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.3,
              crossAxisSpacing: 1,
              mainAxisSpacing: width / 200),
          itemBuilder: (BuildContext, index ){
            return InkWell(
                onTap: (){
                  viewModel.isPlayerOneTurn ?
                  viewModel.checkUserSelectedCard(viewModel.playerOneCards[index]) :
                  viewModel.checkUserSelectedCard(viewModel.playerTwoCards[index]);
                  if (viewModel.winnerDetected == true){
                    viewModel.killCurrentMusic(viewModel.player);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WinnerView(winnerPlayer: viewModel.winnerName, loosePlayer: viewModel.looserName, winnerScore: viewModel.winnerScore, looserScore: viewModel.looserScore, isTwoPlayersMode: viewModel.isTwoPlayersMode,)));
                  }
                },
                child : viewModel.isPlayerOneTurn ?
                  Image.asset(viewModel.playerOneCards[index].uri) :
                  Image.asset(viewModel.playerTwoCards[index].uri),
                );
            },
      ),
    );
  }
}