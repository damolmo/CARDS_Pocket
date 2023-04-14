import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';

class SaveView extends StackedView<SaveModel>{
  @override
   SaveView({
    required this.boardModel,
    required this.isSaveGame,
    required this.player,
    required this.userName,
    super.key
});

  final bool isSaveGame;
  final BoardModel boardModel;
  final AudioPlayer player;
  final String userName;
  int refresh = 1;

  @override
  Widget builder(
      BuildContext context,
      SaveModel viewModel,
      Widget? child,
      ){

    viewModel.userName = userName;
    viewModel.saveGame = isSaveGame;
    viewModel.boardModel = boardModel;
    viewModel.player = player;
    if(refresh == 1){
      viewModel.readSavesFromDataBase();
      refresh = 0;
    }

    return WillPopScope(
      onWillPop: () => viewModel.onReturnToBoard(context),
      child : Scaffold(
      body: viewModel.saveGame ?  SaveScreen(viewModel: viewModel,) :  LoadScreen(viewModel: viewModel,),
      )
    );
  }

  @override
  SaveModel viewModelBuilder(BuildContext context) => SaveModel();
}