import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';
import 'package:path_provider/path_provider.dart';

class SaveModel extends BaseViewModel with MusicControl implements Initialisable{

  bool saveGame = false;
  TextEditingController saveName = TextEditingController(text: "");
  bool isWriting = false;
  late BoardModel boardModel;
  List<Save> saves = [];
  late String boardPreview;
  late AudioPlayer player;
  String playerOneCardsStr = "";
  String playerTwoCardsStr =  "";
  String errorMessage = "";
  late String userName;

  @override
  void initialise(){
  }

  onReturnToBoard(BuildContext context){
    // A method to execute on return to home screen
    boardModel.saving = false;
    boardModel.notifyListeners();
    Navigator.pop(context);
  }

  readSavesFromDataBase() async {
    // A method to read all existing saves on database
    print("userName => $userName" );
    try {
      saves =  await Save.retrieveSavesFromDataBase(userName);
      saves.forEach((element) {print(element.saveName);});
      notifyListeners();
    }
    catch (e){
      print("No existen saves, aún");
    }
  }

  readUserChoosedSave(int index, BuildContext context) async {
    // User choosed save
    // We're going to restore it

    // Point to the choosed save
    Save save = saves[index];

    print("Cartas>>>");
    print(playerOneCardsStr);

    // Decode JSON files
    List<dynamic> playerOneCardsRaw = jsonDecode(save.playerOneCardsUri);
    List<dynamic> playerTwoCardsRaw = jsonDecode(save.playerTwoCardsUri);

    // Create Cards instance from map
    List<Cards> playerOneCards = [];
    List<Cards> playerTwoCards = [];

    for (Map<String,dynamic> card in  playerOneCardsRaw){
      Cards currentCard = Cards.fromMap(card);
      playerOneCards.add(currentCard);
    }

    for(Map<String,dynamic> card in playerTwoCardsRaw){
      Cards currentCard = Cards.fromMap(card);
      playerTwoCards.add(currentCard);
    }

    // Remove existing save
    Save.deleteExistingSave(save);

    // Time to Navigate to board, again
    player.pause();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BoardView(playerOneName: save.playerOneName, playerTwoName: save.playerTwoName, isTwoPlayersMode: save.isTwoPlayersMode == 1 ? true :  false, player: player, playerOneScore: int.parse(save.playerOneScore), playerTwoScore: int.parse(save.playerTwoScore), playerOneCards: playerOneCards, playerTwoCards: playerTwoCards, isBackup: true, currentCardValue: save.currentCardValue, currentCard: save.currentCard, currentCardColor: save.currentCardColor, userName: save.userID,)));

  }

  createCardsStr(String fileName) async {
    // This method will create two JSON files under data
    // Usefull to restore users cards later

    // First, get Documents path

    // Recover users Cards
    List<Cards> playerOne = boardModel.playerOneCards;
    List<Cards> playerTwo = boardModel.playerTwoCards;

    // Create Lists of Map from user cards
    List<Map<String,dynamic>> playerOneCards = [];
    List<Map<String,dynamic>> playerTwoCards = [];

    for (Cards card in playerOne){
      Map<String,dynamic> current = card.toMap();
      playerOneCards.add(current);
    }

    for (Cards card in playerTwo){
      Map<String,dynamic> current  = card.toMap();
      playerTwoCards.add(current);
    }

    // Generate JSON files
    playerOneCardsStr =  jsonEncode(playerOneCards);
    playerTwoCardsStr =  jsonEncode(playerTwoCards);
    notifyListeners();

  }

  writeSaveIntoDataBase(String saveName) async {
    // This method is used to write a new save into db
    bool saveExists = false;
    await createCardsStr(saveName);

    Save.createSavesTable();

    // Generate Save
    Save currentSave = Save(
        saveName: saveName,
        playerOneName: boardModel.playerOneName,
        playerTwoName: boardModel.playerTwoName,
        playerOneScore: boardModel.playerOneScore.toString(),
        playerTwoScore: boardModel.playerTwoScore.toString(),
        currentCard: boardModel.currentCard,
        currentCardValue: boardModel.currentCardValue,
        currentCardColor: boardModel.currentCardColor,
        playerOneCardsUri: playerOneCardsStr,
        playerTwoCardsUri: playerTwoCardsStr,
        userID: boardModel.userName,
        isTwoPlayersMode: boardModel.isTwoPlayersMode ? 1 : 0);

    // Check if fileName exists before creating a new entry
    List<Save> temp = await Save.retrieveSavesFromDataBase(userName);
    temp.forEach((save) {
      if (save.saveName ==  saveName){
        saveExists = true;
        notifyListeners();
      }
    });

    if (saveExists){
      Save.updateSave(currentSave);
      print("successfull updated ");
    } else {
      Save.insertSavesIntoDataBase(currentSave);
      print("success created");
    }
  }



}