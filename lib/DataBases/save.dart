import 'package:sqflite/sqflite.dart';

class Save {

  Save({
    required this.saveName,
    required this.playerOneName,
    required this.playerTwoName,
    required this.playerOneScore,
    required this.playerTwoScore,
    required this.currentCard,
    required this.playerOneCardsUri,
    required this.playerTwoCardsUri,
});

  final String saveName;
  final String playerOneName;
  final String playerTwoName;
  final String playerOneScore;
  final String playerTwoScore;
  final String currentCard;
  final String playerOneCardsUri;
  final String playerTwoCardsUri;




}