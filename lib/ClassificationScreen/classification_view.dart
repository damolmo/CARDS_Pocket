import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';

class ClassificationView extends StackedView<ClassificationModel>{
  @override
  ClassificationView({
    required this.userName,
    required this.player,
    super.key});

  final AudioPlayer player;
  final String userName;
  int refresh = 1;

  @override
  Widget builder(
      BuildContext context,
      ClassificationModel viewModel,
      Widget? child,
      ){

    viewModel.player =  player;
    viewModel.keepMusic(player, context, "keep");

    if (refresh == 1){
      viewModel.userName =  userName;
      viewModel.getClassifications();
      refresh = 0;
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          BackgroundTheme(),

          // Winners Banner
          ClassificationBanner(),

          // Winners List
          ClassificationsList(viewModel: viewModel),

        ],
      ),
    );
  }

  @override
  ClassificationModel viewModelBuilder(BuildContext context) => ClassificationModel();
}