import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../Screens/screens.dart';

class TitleView extends StackedView<TitleModel>{
  const TitleView({
    required this.userName,
    super.key});

  final String userName;

  @override
  Widget builder(
      BuildContext context,
      TitleModel viewModel,
      Widget? child
      ){

    viewModel.userName = userName;

    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          BackgroundTheme(),

          // Copyright
          CopyrightFooter(),

          // Logo
          BannerLogo(),

          // Menu
          ListView(
            children: [
              OptionsMenu(player: viewModel.player, viewModel: viewModel,)
            ]),


        ],

      ),
    );
  }

  @override
  TitleModel viewModelBuilder(BuildContext context) => TitleModel();

}