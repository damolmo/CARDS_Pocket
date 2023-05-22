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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(238, 34, 41, 1.0),
        title : Row(
          children : [
            // Left - Guide Icon
            IconButton(
                onPressed: (){
                  // TO-DO
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => GuideView()));
                },
                icon: const Icon(Icons.book_rounded, color: Colors.white, size: 25,)),
            const Spacer(),

            IconButton(
                onPressed: (){
                  // TO-DO
                  viewModel.logoutScreen = true;
                  viewModel.notifyListeners();
                },
                icon: const Icon(Icons.logout_rounded, color: Colors.white, size : 25,)),
          ]
        )
      ),
      body: Stack(
        children: [

          // Background Theme
          if(!viewModel.logoutScreen)
          BackgroundTheme(),

          // Copyright
          if(!viewModel.logoutScreen)
          CopyrightFooter(),

          // Logo
          if(!viewModel.logoutScreen)
          TitleLogo(),

          // Menu
          if(!viewModel.logoutScreen)
            ListView(
                children: [
                  OptionsMenu(player: viewModel.player, viewModel: viewModel,)
                ]),

          // Floating Store Button
          if (!viewModel.logoutScreen)
            StoreButton(viewModel: viewModel),



          // Logout Screen
          if (viewModel.logoutScreen)
            LogoutScreen(viewModel: viewModel),
        ],

      ),
    );
  }

  @override
  TitleModel viewModelBuilder(BuildContext context) => TitleModel();

}