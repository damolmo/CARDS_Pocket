import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../Screens/screens.dart';

class TitleView extends StackedView<TitleModel>{
  const TitleView({super.key});

  @override
  Widget builder(
      BuildContext context,
      TitleModel viewModel,
      Widget? child
      ){
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
              OptionsMenu(player: viewModel.player,)
            ]),


        ],

      ),
    );
  }

  @override
  TitleModel viewModelBuilder(BuildContext context) => TitleModel();

}