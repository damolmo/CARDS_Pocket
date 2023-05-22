import 'package:stacked/stacked.dart';

class GuideModel extends BaseViewModel implements Initialisable{

  int choosedOption =  0;
  String currentTitleUri = "";
  bool showExplanation = false;

  Map<dynamic,dynamic> optionTitle = {
    0 : {
      "title" : "assets/guide/how_to_play.png",
      "images" : ["assets/guide/choose/screen_0.png", "assets/guide/choose/screen_1.png", "assets/guide/choose/screen_2.png", "assets/logo/logo.png" ],
      "strings" : ["1.- Fijate en la carta que se encuentra en el centro en ese momento", "2.- Lanza una carta del mismo color", "3.- O lanza una carta de distinto color y mismo valor", "4.- Eso es lo básico, ¡a jugar!" ],
    },

    1 : {
      "title" : "assets/guide/who_wins.png",
      "images" : ["assets/guide/winner/screen_0.png", "assets/guide/winner/screen_1.png", "assets/guide/winner/screen_2.png"  ],
      "strings" : ["1.- Si tienes una carta en tu deck", "2.- Y tu rival también tiene una carta", "3.- ¡Ganará el primero en quedarse sin cartas!"],
    },

    2 : {
      "title" : "assets/guide/special_cards.png",
      "images" : [ "assets/deck/CARDS_Pocket_Original/blue/draw_2.png", "assets/deck/CARDS_Pocket_Original/blue/reverse.png", "assets/deck/CARDS_Pocket_Original/blue/skip.png", "assets/deck/CARDS_Pocket_Original/wild/wild.png", "assets/deck/CARDS_Pocket_Original/wild/wild_draw_4.png" ],
      "strings" : ["Carta x2 : Esta carta obliga al usuario siguiente a picar 2 cartas, puede repelerse con otra carta x2", "Carta Reverse : Vuelve a tocarle turno al usuario que la lanza ", "Carta Skip : Se salta el turno del siguiente usuario", "Carta Wild : Permite al usuario que la lanza cambiar el color actual del tablero", "Carta x4 : Funciona igual que la carta x2, también se puede repeler" ],
    },

    3 : {
      "title" : "assets/guide/playing_modes.png",
      "images" : ["assets/guide/players/screen_players.png", "assets/guide/players/screen_players.png" ],
      "strings" : ["Modo 1 Jugador : Juega contra la CPU, Roby, el cual es bastante rápido eligiendo!.", "Modo 2 Jugadores : Juega en un mismo dispositivo con otro usuario, este modo es más relajado y cuenta con pausas por turno."],
    },
  };


  @override
  void initialise(){

  }

  setTitle() async {
    // This method receives the index of the current button
    // Assigns a title to current page, dynamically
    currentTitleUri = optionTitle[choosedOption]["title"];
    notifyListeners();

  }

  backToHome() async {
    // A method to return to main screen to show a different content
    showExplanation = false;
    notifyListeners();
  }

}