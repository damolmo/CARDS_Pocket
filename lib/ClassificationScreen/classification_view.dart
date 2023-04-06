import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';

class ClassificationView extends StackedView<ClassificationModel>{
  @override
  ClassificationView({
    required this.player,
    super.key});

  final AudioPlayer player;

  @override
  Widget builder(
      BuildContext context,
      ClassificationModel viewModel,
      Widget? child,
      ){

    viewModel.player =  player;
    viewModel.keepMusic(player, context, "keep");

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