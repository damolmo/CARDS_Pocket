import 'package:flutter/material.dart';
import 'package:uno_pocket/GuideScreen/guide_model.dart';

class GuideMenu extends StatelessWidget{
  @override
  const GuideMenu({
    required this.viewModel,
    super.key});

  final GuideModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<Color> optionsButtonColor = [Colors.blueAccent.withOpacity(0.8),Colors.redAccent.withOpacity(0.8),Colors.orangeAccent.withOpacity(0.8),Colors.greenAccent.withOpacity(0.8), ];
    List<String> optionsButtonsTitle = ["Cómo se juega","Quien gana","Cartas especiales","Modos de juego"];

    return Container(
      width: double.maxFinite,
      height: height * 0.55,
      margin: EdgeInsets.only(top: height * 0.35, bottom: height * 0.05),
      child: ListView.builder(
        itemCount: optionsButtonsTitle.length,
        itemBuilder: (context, index){
          return Container(
            width: double.maxFinite,
            height: height * 0.08,
            margin: EdgeInsets.only(top: height * 0.03, left: width * 0.05, right: width * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: optionsButtonColor[index],
                  ),
                  onPressed: (){
                    viewModel.choosedOption = index;
                    viewModel.setTitle();
                    viewModel.showExplanation = true;
                    viewModel.notifyListeners();
                  },
                  child: Text(optionsButtonsTitle[index], style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ),
              )
            ),
          );
        }
      ),
    );
  }

}