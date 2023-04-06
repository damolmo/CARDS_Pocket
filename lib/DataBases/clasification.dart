import 'package:sqflite/sqflite.dart';

class Classification{

  Classification({
    required this.userName,
    required this.userLosts,
    required this.userVictories,
    required this.userPoints,
    required this.userGames,

});
  final String userName;
  final int userLosts;
  final int userVictories;
  final int userPoints;
  final int userGames;

  static const classificationTable = """
    CREATE TABLE IF NOT EXISTS classifications(
      userName TEXT PRIMARY KEY,
      userLosts INTEGER,
      userVictories INTEGER,
      userPoints INTEGER,
      userGames INTEGER);
  """;

  Map<String,dynamic> toMap(){
    return{
      "userName" :  userName,
      "userLosts" : userLosts,
      "userVictories" :  userVictories,
      "userPoints" :  userPoints,
      "userGames" :  userGames,
    };
  }

  factory Classification.fromMap(Map<String,dynamic> map) => Classification(
    userName: map["userName"],
    userLosts: map["userLosts"],
    userVictories: map["userVictories"],
    userPoints: map["userPoints"],
    userGames: map["userGames"],
  );


  static createClassificationTable() async {
    // A simple method to create the classifications table
    final Database db = await openDatabase("uno.db");

    db.transaction((txn) => txn.execute(classificationTable));
  }

  static insertEntryClassification(Classification classification) async {
    // A simple method to insert
    final Database db = await openDatabase("uno.db");

    db.insert("classifications",
        classification.toMap());
  }

  static updateEntryClassification(Classification classification) async {
    // A simple method to update
    final Database db = await openDatabase("uno.db");

    db.update("classifications", classification.toMap(), where: 'userName = ?', whereArgs: [classification.userName] );

  }


  static Future<List<Classification>> retrieveClassifications() async {
    // Reads current classifications from database

    List<Classification> getClassifications(List<Map<String,dynamic>> rawClassifications){
      // Return a list with all classifications
      List<Classification> classifications  = [];

      for (Map<String,dynamic> classification in rawClassifications){
        Classification current =  Classification.fromMap(classification);
        classifications.add(current);
      }

      return classifications;

    }

    final Database db = await openDatabase("uno.db");
    List<Map<String,dynamic>> rawClassifications = await db.query("classifications");
    List<Classification> classifications  = getClassifications(rawClassifications);

    return classifications;

  }


}