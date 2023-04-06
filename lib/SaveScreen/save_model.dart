import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';

class SaveModel extends BaseViewModel with MusicControl implements Initialisable{

  bool saveGame = false;
  TextEditingController saveName = TextEditingController(text: "");
  bool isWriting = false;
  late BoardModel boardModel;

  @override
  void initialise(){

  }

  onReturnToBoard(BuildContext context){
    // A method to execute on return to home screen
    boardModel.saving = false;
    boardModel.notifyListeners();
    Navigator.pop(context);

  }



}