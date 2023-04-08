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


  static const savesTable = """
    CREATE TABLE IF NOT EXISTS saves (
      saveName TEXT PRIMARY KEY,
      playerOneName TEXT,
      playerTwoName TEXT,
      playerOneScore TEXT,
      playerTwoScore TEXT,
      currentCard TEXT,
      playerOneCardsUri TEXT,
      playerTwoCardsUri TEXT);
  """;

  Map<String,dynamic> toMap(){
    return {
      "saveName" :  saveName,
      "playerOneName" :  playerOneName,
      "playerTwoName" : playerTwoName,
      "playerOneScore" :  playerOneScore,
      "playerTwoScore" :  playerTwoScore,
      "currentCard" :  currentCard,
      "playerOneCardsUri" : playerOneCardsUri,
      "playerTwoCardsUri" :  playerTwoCardsUri,
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
    playerOneCardsUri: map["playerOneCardsUri"],
    playerTwoCardsUri: map["playerTwoCardsUri"],
  );

  static createSavesTable() async {
    // A method to create the saves table
    final Database db = await openDatabase("uno.db");

    db.transaction((txn) => txn.execute(savesTable));
  }

  static updateSave(Save save) async {
    // Just in case a save already exists
    final Database db = await openDatabase("uno.db");

    db.update("saves",
              save.toMap(),
              where: "saveName = ? ",
              whereArgs: [save.saveName]);
  }

  static insertSavesIntoDataBase(Save save) async {
    // This method is used to insert new entries into database
    final Database db = await openDatabase("uno.db");

    db.insert("saves",
        save.toMap());
  }

  static Future<List<Save>> retrieveSavesFromDataBase() async {
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


    final Database db = await openDatabase("uno.db");
    List<Map<String,dynamic>> rawSaves = await db.query("saves");
    List<Save> saves = getSaves(rawSaves);

    return saves;
  }
}