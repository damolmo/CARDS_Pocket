import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../Screens/screens.dart';

class WinnerView extends StackedView<WinnerModel>{
  @override
  const WinnerView({
    required this.winnerPlayer,
    required this.loosePlayer,
    required this.winnerScore,
    required this.looserScore,
    super.key});

  final String winnerPlayer;
  final String loosePlayer;
  final int winnerScore;
  final int looserScore;

  @override
  Widget builder(
      BuildContext context,
      WinnerModel viewModel,
      Widget? child
      ){

    viewModel.winnerName =  winnerPlayer;
    viewModel.looseName = loosePlayer;
    viewModel.winnerScore = winnerScore;
    viewModel.looserScore = looserScore;

    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          BackgroundTheme(),

          // Winner Message
          const WinnerMessage(),

          // Winner Player
          WinnerName(viewModel: viewModel),

          // Winner Menu
          WinnerMenu(viewModel: viewModel),

        ],
      ),
    );
  }
  @override
  WinnerModel viewModelBuilder(BuildContext context) => WinnerModel();

}