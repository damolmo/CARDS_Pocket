import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../Screens/screens.dart';

class PlayersNameView extends StackedView<PlayersNameModel>{
  PlayersNameView({
   required this.isTwoPlayersMode,
    required this.player,
});

  final bool isTwoPlayersMode;
  final AudioPlayer player;

  @override
  Widget builder(
      BuildContext context,
      PlayersNameModel viewModel,
      Widget? child
      ){

    viewModel.isTwoPlayerMode = isTwoPlayersMode;
    viewModel.player = player;
    viewModel.keepMusic(player, context, "keep");

    return WillPopScope(
        onWillPop: () => viewModel.keepMusic(player, context, "return"),
        child : Scaffold(
          body: Stack(
            children: [
              // Background Theme
              BackgroundTheme(),

              // Banner
              BannerLogo(),

              // Elevated Field Name
              ElevatedFieldName(viewModel: viewModel),
              // Button
              FieldName(viewModel: viewModel, isTwoPlayersMode: isTwoPlayersMode, player: player,),
            ],
          ),
        ),
    );
  }
  @override
  PlayersNameModel viewModelBuilder(BuildContext context) => PlayersNameModel();
}