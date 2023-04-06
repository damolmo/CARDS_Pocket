import 'package:audioplayers/audioplayers.dart';
import 'package:stacked/stacked.dart';
import 'package:uno_pocket/musicControl.dart';

class PlayersModel extends BaseViewModel with MusicControl implements Initialisable {
  bool isTwoPlayersMode = false;
  AudioPlayer player = AudioPlayer();

  @override
  void initialise(){
  }


}