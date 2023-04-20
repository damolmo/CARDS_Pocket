import 'package:stacked/stacked.dart';

class GuideModel extends BaseViewModel implements Initialisable{

  int choosedOption =  0;
  String currentTitleUri = "";
  bool showExplanation = false;

  Map<dynamic,dynamic> optionTitle = {
    0 : {
      "title" : "assets/guide/how_to_play.png",
      "images" : ["assets/deck/blue/0.png", "assets/deck/blue/1.png", "assets/deck/red/0.png", "assets/deck/red/0.png" ],
      "strings" : ["1.- Fijate en la carta que se encuentra en el centro en ese momento", "2.- Lanza una carta del mismo color", "3.- O lanza una carta de distinto color y mismo valor", "4.- Eso es lo básico, ¡a jugar!" ],
    },

    1 : {
      "title" : "assets/guide/who_wins.png",
      "images" : ["assets/deck/blue/0.png", "assets/deck/blue/1.png", "assets/deck/blue/2.png", "assets/deck/blue/3.png" ],
      "strings" : ["Carta 0 azul", "Carta 1 azul", "Carta 2 azul", "Carta 3 azul" ],
    },

    2 : {
      "title" : "assets/guide/special_cards.png",
      "images" : ["assets/deck/blue/0.png", "assets/deck/blue/1.png", "assets/deck/blue/2.png", "assets/deck/blue/3.png" ],
      "strings" : ["Carta 0 azul", "Carta 1 azul", "Carta 2 azul", "Carta 3 azul" ],
    },

    3 : {
      "title" : "assets/guide/playing_modes.png",
      "images" : ["assets/deck/blue/0.png", "assets/deck/blue/1.png", "assets/deck/blue/2.png", "assets/deck/blue/3.png" ],
      "strings" : ["Carta 0 azul", "Carta 1 azul", "Carta 2 azul", "Carta 3 azul" ],
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