import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uno_pocket/StoreScreen/widgets/storeCardsPreview.dart';
import '../Screens/screens.dart';

class StoreView extends StackedView<StoreModel>{
  @override
   StoreView({
    required this.homePlayer,
    required this.userID,
    super.key});

  final AudioPlayer homePlayer;
  final String userID;
  bool modelCreated = false;

  @override
  Widget builder(
      BuildContext context,
      StoreModel viewModel,
      Widget? child
      ){

    if (!modelCreated){
      homePlayer.pause();
      viewModel.homePlayer = homePlayer;
      viewModel.userID = userID;
      modelCreated = true;
    }


    return WillPopScope(
        onWillPop: () => viewModel.resumeMainTheme(context),
        child : Scaffold(
          body : Stack(
            children: [
              // Background Theme
              if(!viewModel.showPreview)
              BackgroundTheme(),

              // Banner
              if (!viewModel.showPreview)
                SafeArea(child: StoreBanner(),),


              // Menu
              if (!viewModel.showPreview)
              StoreMenu(viewModel: viewModel),

              // Preview Screen
              if (viewModel.showPreview)
                StoreCardsPreview(viewModel: viewModel),
            ],
          )
        ),
    );
  }

  @override
  StoreModel viewModelBuilder(BuildContext context) => StoreModel();

}