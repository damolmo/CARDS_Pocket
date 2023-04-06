import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uno_pocket/UserScreen/widgets/userResume.dart';

import '../Screens/screens.dart';

class UserView extends StackedView<UserModel>{
  @override
  const UserView({
    required this.user,
    required this.player,
    super.key
  });

  final Classification user;
  final AudioPlayer player;

  @override
  Widget builder(
      BuildContext context,
      UserModel viewModel,
      Widget? child
      ){

    viewModel.userClassification =  user;
    viewModel.notifyListeners();
    viewModel.keepMusic(player, context, "keep");

    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          BackgroundTheme(),

          // Banner
          UserResume(viewModel: viewModel),

        ],
      ),
    );
  }
  @override
  UserModel viewModelBuilder(BuildContext context)  => UserModel();
}