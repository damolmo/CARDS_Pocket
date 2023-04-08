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
      margin: EdgeInsets.only(top: height * 0.1, right: width * 0.1, left: width * 0.1, bottom: height * 0.1),
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
          viewModel.writeSaveIntoDataBase(viewModel.saveName.text);
          viewModel.killCurrentMusic(viewModel.player);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TitleView()));
        },
        child: Text("Guardar Partida", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}