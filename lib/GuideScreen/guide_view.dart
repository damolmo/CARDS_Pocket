import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../Screens/screens.dart';

class GuideView extends StackedView<GuideModel>{
  @override
  const GuideView({super.key});

  @override
  Widget builder(
      BuildContext context,
      GuideModel viewModel,
      Widget? child,
      ){

    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          if (!viewModel.showExplanation)
          BackgroundTheme(),

          // Banner
          if (!viewModel.showExplanation)
          GuideBanner(),

          // Menu
          if (!viewModel.showExplanation)
          GuideMenu(viewModel: viewModel,),

          // Explanation Screen
          if (viewModel.showExplanation)
            ExplanationScreen(viewModel: viewModel),

        ],
      ),
    );
  }

  @override
  GuideModel viewModelBuilder(BuildContext context) => GuideModel();
}