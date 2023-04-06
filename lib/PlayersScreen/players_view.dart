import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../Screens/screens.dart';

class PlayersView extends StackedView<PlayersModel>{
  const PlayersView({
    required this.player,
    super.key});

  final AudioPlayer player;

  @override
  Widget builder(
      BuildContext context,
      PlayersModel viewModel,
      Widget? child
      ){

    viewModel.player = player;
    viewModel.keepMusic(player, context, "keep");

    return WillPopScope(
        onWillPop: () => viewModel.keepMusic(player, context, "return"),
        child : Scaffold(
          body: Stack(
            children: [
              // Background Color
              BackgroundTheme(),

              // Banner
              BannerLogo(),

              // Players Menu
              ListView(
                children: [
                  PlayersMenu(viewModel: viewModel, player:  player,),
                ],
              )
            ],
          ),
        ),
    );
  }

  @override
  PlayersModel viewModelBuilder(BuildContext context) => PlayersModel();

}