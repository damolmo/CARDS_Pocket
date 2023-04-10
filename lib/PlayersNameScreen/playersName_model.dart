import 'package:audioplayers/audioplayers.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:uno_pocket/musicControl.dart';

class PlayersNameModel extends BaseViewModel with MusicControl implements Initialisable{

  bool isTwoPlayerMode = false;
  bool isPlayerOneFieldComplete = false;
  TextEditingController playerOneName = TextEditingController(text: "");
  TextEditingController playerTwoName = TextEditingController(text: "");
  AudioPlayer player = AudioPlayer();
  bool isWriting = false;
  String errorMessage = "";
  bool isFieldCompleted = false;

  @override
  void initialise(){
  }


}