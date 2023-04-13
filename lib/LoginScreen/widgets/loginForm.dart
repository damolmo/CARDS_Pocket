import 'package:flutter/material.dart';
import 'package:uno_pocket/LoginScreen/login_model.dart';
import 'package:uno_pocket/Screens/screens.dart';

class LoginForm extends StatelessWidget{
  @override
  const LoginForm({
    required this.viewModel,
    super.key
});

  final LoginModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.65,
      margin: EdgeInsets.only(top: height * 0.25, bottom: height * 0.05, left: width * 0.05, right: width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.redAccent.shade700, offset: Offset.zero, blurRadius: 3.0, blurStyle: BlurStyle.normal )]
      ),
      child: Column(
        children: [
          // Form Title
          FormTitle(viewModel: viewModel),

          // Form Fields
          FormFields(viewModel: viewModel),

          // Form Button
          FormButton(viewModel: viewModel,),

        ],
      ),

    );
  }
}

class FormTitle extends StatelessWidget{
  @override
  const FormTitle({
    required this.viewModel,
    super.key});

  final LoginModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(top: height * 0.02, bottom: height * 0.025, left: width * 0.1, right: width * 0.1),
      child: Row(
        children: [
          const Spacer(),
          Text(viewModel.existingAccounts ? "Iniciar Sesión" : "Crear Cuenta", style: TextStyle(color: Colors.black, fontSize: width * 0.08, fontWeight: FontWeight.bold, ), textAlign: TextAlign.center, ),
          const Spacer(),
        ],
      )
    );
  }
}

class FormFields extends StatelessWidget{
  @override
  const FormFields({
    required this.viewModel,
    super.key,
});

  final LoginModel viewModel;

  @override
  Widget build (BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.30,
      margin: EdgeInsets.only( left: width * 0.05, right: width * 0.05),
      child: Column(
        children: [
          // UserName Field
          Container(
            width: double.maxFinite,
            height: height * 0.12,
            margin: EdgeInsets.only(bottom: height * 0.01, left: width * 0.02, right: width * 0.02),
            child: TextField(
              style: const TextStyle(fontSize: 25),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Introduce un usuario",
                hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 20),
                errorText: viewModel.fieldNameError,
                errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                icon: const Icon(Icons.face_rounded, color: Colors.blue,),
                fillColor: Colors.white,
                filled: true,
              ),
              controller: viewModel.userNameController,
              keyboardType: TextInputType.name,
            ),
          ),

          // PassWord Field
          Container(
            width: double.maxFinite,
            height: height * 0.12,
            margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02, bottom: height * 0.05),
            child: TextField(
              style: const TextStyle(fontSize: 25),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Introduce una contraseña",
                errorText: viewModel.fieldPasswordError,
                errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 20),
                icon: const Icon(Icons.lock_rounded, color: Colors.blue,),
                filled: true,
                fillColor: Colors.white
              ),
              controller: viewModel.userPasswordController,
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
        ],
      ),
    );
  }
}

class FormButton extends StatelessWidget{
  @override
  const FormButton({
    required this.viewModel,
    super.key});

  final LoginModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.07,
      margin: EdgeInsets.only(bottom: height * 0.05, left: width * 0.1, right: width * 0.1),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
        child : TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent
          ),
          onPressed : (){
            viewModel.existingAccounts ?  viewModel.loginIntoAccount() :  viewModel.createAccount();
            if (viewModel.loginSucceed ) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TitleView()));
            }
          },
          child: Text(viewModel.existingAccounts ? "Iniciar" : "Registrar", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}