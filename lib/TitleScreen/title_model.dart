import 'package:stacked/stacked.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:uno_pocket/Data/cardsData.dart';
import 'package:uno_pocket/DataBases/cards.dart';
import 'package:uno_pocket/musicControl.dart';

class TitleModel extends BaseViewModel with MusicControl implements Initialisable{

  AudioPlayer player = AudioPlayer();
  late String userName;
  bool logoutScreen = false;

  @override
  void initialise(){
    startLoop(player);
  }

}