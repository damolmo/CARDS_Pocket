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

            List<Cards> playerTwoCards = [];

            for (Cards card in viewModel.playerTwoCards){
              if (!viewModel.isTwoPlayersMode){
                playerTwoCards.add(Cards(name: "name", color: "color", value: "", uri: "assets/logo/deck.png", collection: ""));
              } else {
                playerTwoCards.add(card);
              }
            }

            viewModel.isPlayerOneTurn ?  viewModel.currentCards = viewModel.playerOneCards :  viewModel.currentCards = playerTwoCards;


            return LongPressDraggable(
              data: viewModel.choosedCard = index,
                child : Container(
                  width : double.maxFinite,
                  height : height * 0.35,
                  child : Image.asset(viewModel.currentCards[index].uri),
                ),
              feedback: Container(
                height: height * 0.45,
                child: Image.asset(viewModel.currentCards[index].uri),
                 ),
              childWhenDragging: !viewModel.isCardDropped ? Container(
                height: height * 0.35,
                child: Image.asset("assets/deck/dragging.png"),
              ) : Container(),
            );
            },
      ),
    );
  }
}