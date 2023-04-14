import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Save {

  Save({
    required this.saveName,
    required this.playerOneName,
    required this.playerTwoName,
    required this.playerOneScore,
    required this.playerTwoScore,
    required this.currentCard,
    required this.currentCardColor,
    required this.currentCardValue,
    required this.playerOneCardsUri,
    required this.playerTwoCardsUri,
    required this.isTwoPlayersMode,
    required this.userID,
});

  final String saveName;
  final String playerOneName;
  final String playerTwoName;
  final String playerOneScore;
  final String playerTwoScore;
  final String currentCard;
  final String currentCardColor;
  final String currentCardValue;
  final String playerOneCardsUri;
  final String playerTwoCardsUri;
  final int isTwoPlayersMode;
  final String userID;


  static const savesTable = """
    CREATE TABLE IF NOT EXISTS saves (
      id INTEGER PRIMARY KEY,
      saveName TEXT,
      playerOneName TEXT,
      playerTwoName TEXT,
      playerOneScore TEXT,
      playerTwoScore TEXT,
      currentCard TEXT,
      currentCardColor TEXT,
      currentCardValue TEXT,
      playerOneCardsUri TEXT,
      playerTwoCardsUri TEXT,
      isTwoPlayersMode INTEGER,
      userID TEXT,
      FOREIGN KEY(userID) REFERENCES accounts(userName));
  """;

  Map<String,dynamic> toMap(){
    return {
      "saveName" :  saveName,
      "playerOneName" :  playerOneName,
      "playerTwoName" : playerTwoName,
      "playerOneScore" :  playerOneScore,
      "playerTwoScore" :  playerTwoScore,
      "currentCard" :  currentCard,
      "currentCardColor" : currentCardColor,
      "currentCardValue" :  currentCardValue,
      "playerOneCardsUri" : playerOneCardsUri,
      "playerTwoCardsUri" :  playerTwoCardsUri,
      "isTwoPlayersMode" :  isTwoPlayersMode,
      "userID" :  userID,
    };
  }

  factory Save.fromMap(Map<String,dynamic> map) =>
  Save(
    saveName: map["saveName"],
    playerOneName: map["playerOneName"],
    playerTwoName: map["playerTwoName"],
    playerOneScore: map["playerOneScore"],
    playerTwoScore: map["playerTwoScore"],
    currentCard: map["currentCard"],
    currentCardColor :  map["currentCardColor"],
    currentCardValue: map["currentCardValue"],
    playerOneCardsUri: map["playerOneCardsUri"],
    playerTwoCardsUri: map["playerTwoCardsUri"],
    isTwoPlayersMode: map["isTwoPlayersMode"],
    userID: map["userID"],
  );

  static createSavesTable() async {
    // A method to create the saves table

    if (kIsWeb){
      // Create web table
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.transaction((txn) => txn.execute(savesTable));
    } else {
      final Database db = await openDatabase("uno.db");
      db.transaction((txn) => txn.execute(savesTable));
    }

  }

  static updateSave(Save save) async {
    // Just in case a save already exists

    if (kIsWeb){
      // Update web table
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.update("saves", save.toMap(), where: "saveName = ?", whereArgs: [save.saveName]);

    } else {
      final Database db = await openDatabase("uno.db");
      db.update("saves", save.toMap(), where: "saveName = ?", whereArgs: [save.saveName]);
    }


  }

  static insertSavesIntoDataBase(Save save) async {
    // This method is used to insert new entries into database

    if (kIsWeb){
      // Insert into web database
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.insert("saves", save.toMap());
    } else {
      final Database db = await openDatabase("uno.db");
      db.insert("saves", save.toMap());
    }

  }

  static Future<List<Save>> retrieveSavesFromDataBase(String id) async {
    // A method to get all saves on existing database

    List<Save> getSaves(List<Map<String,dynamic>> rawSaves) {
      // A method to get all saves on existing map
      List<Save> saves = [];
      for (Map<String,dynamic> save in rawSaves){
        Save currentSave = Save.fromMap(save);
        saves.add(currentSave);
      }
      return saves;
    }

    List<Map<String,dynamic>> rawSaves = [];

    if (kIsWeb){
      // Retrieve web entries
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      rawSaves = await db.query("saves", columns: ['saveName', 'playerOneName', 'playerTwoName', 'playerOneScore', 'playerTwoScore', 'currentCard', 'currentCardColor', 'currentCardValue', 'playerOneCardsUri', 'playerTwoCardsUri', 'isTwoPlayersMode', 'userID'], where: "userID = ?", whereArgs: [id]);
    } else {
      final Database db = await openDatabase("uno.db");
      rawSaves = await db.query("saves", columns: ['saveName', 'playerOneName', 'playerTwoName', 'playerOneScore', 'playerTwoScore', 'currentCard', 'currentCardColor', 'currentCardValue', 'playerOneCardsUri', 'playerTwoCardsUri', 'isTwoPlayersMode', 'userID'], where: "userID = ?", whereArgs: [id]);
    }

    List<Save> saves = getSaves(rawSaves);

    return saves;
  }
}