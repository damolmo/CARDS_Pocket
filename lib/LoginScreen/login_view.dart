import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uno_pocket/LoginScreen/widgets/formChanger.dart';
import '../Screens/screens.dart';

class LoginView extends StackedView<LoginModel>{
  @override
  const LoginView({super.key});

  @override
  Widget builder(
      BuildContext context,
      LoginModel viewModel,
      Widget? child
      ){
    return Scaffold(
      body: Stack(
        children: [
          // Background theme
          BackgroundTheme(),

          // Small Banner logo
          const SmallLogo(),

          // Expanded Form Menu
          ListView(
            children: [
              LoginForm(viewModel: viewModel),
            ],
          ),

          // Form Changer
          FormChanger(viewModel: viewModel),
        ],
      ),
    );
  }

  @override
  LoginModel viewModelBuilder(BuildContext context) => LoginModel();
}