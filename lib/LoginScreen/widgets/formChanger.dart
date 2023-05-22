import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class FormChanger extends StatelessWidget{
  @override
  const FormChanger({
    required this.viewModel,
    super.key
  });

  final LoginModel viewModel;

  @override
  Widget build(BuildContext context){

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.maxFinite,
      height: height * 0.03,
      margin: EdgeInsets.only(top: height * 0.95, bottom: height * 0.02),
      child: InkWell(
          onTap: (){
            viewModel.existingAccounts ? viewModel.existingAccounts = false : viewModel.existingAccounts = true;
            viewModel.notifyListeners();
          },
          child : Text(viewModel.existingAccounts ? "Crear Cuenta" : "Iniciar Sesión", style: TextStyle(color: Colors.white, fontSize: height * 0.03, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
      ),
    );
  }

}