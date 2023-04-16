import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uno_pocket/LoginScreen/widgets/formChanger.dart';
import '../Screens/screens.dart';

class LoginView extends StackedView<LoginModel>{
  @override
  LoginView({super.key});

  int counter = 1;

  @override
  Widget builder(
      BuildContext context,
      LoginModel viewModel,
      Widget? child
      ){

   if (viewModel.loginExists){
      viewModel.startCountDown(context);
   }

    return Scaffold(
      body: Stack(
        children: [
          // Background theme
          BackgroundTheme(),

          // Small Banner logo
          const SmallLogo(),

          // Expanded Form Menu
          if(!viewModel.loginExists)
          ListView(
            children: [
              LoginForm(viewModel: viewModel),
            ],
          ),

          // Form Changer
          if (!viewModel.loginExists)
          FormChanger(viewModel: viewModel),

          // Loading Animation
          if (viewModel.loginExists)
            LoadingAnimation(),
        ],
      ),
    );
  }

  @override
  LoginModel viewModelBuilder(BuildContext context) => LoginModel();
}