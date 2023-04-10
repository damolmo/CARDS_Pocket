import 'package:flutter/material.dart';
import 'package:uno_pocket/PlayersNameScreen/playersName_model.dart';

class ElevatedFieldName extends StatelessWidget{
  @override
  const ElevatedFieldName({
    required this.viewModel,
});

  final PlayersNameModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height:  double.maxFinite,
      margin: EdgeInsets.only(left: width * 0.05, right:  width * 0.05, top: viewModel.isWriting ? height * 0.02: height * 0.6),
      child:  SizedBox(
        height : double.maxFinite,
        width: double.maxFinite,
        child : ListView(
            children  : [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
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

                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  controller: viewModel.isTwoPlayerMode && viewModel.isPlayerOneFieldComplete ?  viewModel.playerTwoName :  viewModel.playerOneName ,
                ),
              ),
            ]
        ),
      ),
    );
  }
}