import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class SaveScreen extends StatelessWidget{
  @override
  const SaveScreen({
    required this.viewModel,
    super.key
  });

  final SaveModel viewModel;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          BackgroundTheme(),

          // Title
          SaveScreenTitle(),

          // SaveName Field
          SaveField(viewModel: viewModel),

          // Save Button
          SaveButton(viewModel: viewModel,),
        ],
      ),
    );
  }
}

class SaveScreenTitle extends StatelessWidget{
  @override
  const SaveScreenTitle({super.key});

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(top: height * 0.1, right: width * 0.2, left: width * 0.2, bottom: height * 0.1),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/saveGame/saveGame.png"),
          fit: BoxFit.fitWidth
        )
      ),
    );
  }
}

class SaveField extends StatelessWidget{
  @override
  const SaveField({
    required this.viewModel,
    super.key
  });

  final SaveModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      margin: EdgeInsets.only(top: viewModel.isWriting ? height * 0.05 : height * 0.5 , left: width * 0.1, right: width * 0.1),
      child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child : ListView(
            children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(80),
                child : TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
                  onTap: (){
                    viewModel.isWriting = true;
                    viewModel.notifyListeners();
                  },

                  onEditingComplete: (){
                    viewModel.isWriting = false;
                    viewModel.notifyListeners();
                    FocusScope.of(context).unfocus();

                  },

                  onTapOutside: (_){
                    viewModel.isWriting = false;
                    viewModel.notifyListeners();

                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    errorStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    filled: true,
                  ),
                  controller: viewModel.saveName,
                ),
              ),
            ],
          ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget{

  @override
  SaveButton({
    required this.viewModel,
    super.key,
});

  final SaveModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.15,
      margin: EdgeInsets.only(top: height * 0.8  ,bottom: height * 0.1, left: width * 0.1, right: width * 0.1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child : TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.greenAccent,
        ),
        onPressed : (){
          if (viewModel.saveName.text.isNotEmpty){
            viewModel.writeSaveIntoDataBase(viewModel.saveName.text);
            viewModel.killCurrentMusic(viewModel.player);
            viewModel.notifyListeners();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TitleView()));
          } else {
            var snack = SnackBar(content: Text("El nombre es obligatorio", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25), textAlign: TextAlign.center,), behavior: SnackBarBehavior.floating ,);
            ScaffoldMessenger.of(context).showSnackBar(snack);
            viewModel.notifyListeners();
          }

        },
        child: Text("Guardar Partida", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}