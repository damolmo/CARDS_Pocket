import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';

class SaveView extends StackedView<SaveModel>{
  @override
  const SaveView({
    required this.boardModel,
    required this.isSaveGame,
    super.key
});

  final bool isSaveGame;
  final BoardModel boardModel;

  @override
  Widget builder(
      BuildContext context,
      SaveModel viewModel,
      Widget? child,
      ){

    viewModel.saveGame = isSaveGame;
    viewModel.notifyListeners();
    viewModel.boardModel = boardModel;

    return WillPopScope(
      onWillPop: () => viewModel.onReturnToBoard(context),
      child : Scaffold(
      body: viewModel.saveGame ?  SaveScreen(viewModel: viewModel,) :  LoadScreen(),
      )
    );
  }

  @override
  SaveModel viewModelBuilder(BuildContext context) => SaveModel();
}