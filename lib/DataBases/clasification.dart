import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Classification{

  Classification({
    required this.userName,
    required this.userLosts,
    required this.userVictories,
    required this.userPoints,
    required this.userGames,
    required this.userID,

});
  final String userName;
  final int userLosts;
  final int userVictories;
  final int userPoints;
  final int userGames;
  final String userID;

  static const classificationTable = """
    CREATE TABLE IF NOT EXISTS classifications(
      id INTEGER PRIMARY KEY,
      userName TEXT,
      userLosts INTEGER,
      userVictories INTEGER,
      userPoints INTEGER,
      userGames INTEGER,
      userID TEXT,
      FOREIGN KEY(userID) REFERENCES accounts(userName));
  """;

  Map<String,dynamic> toMap(){
    return{
      "userName" :  userName,
      "userLosts" : userLosts,
      "userVictories" :  userVictories,
      "userPoints" :  userPoints,
      "userGames" :  userGames,
      "userID" : userID,
    };
  }

  factory Classification.fromMap(Map<String,dynamic> map) => Classification(
    userName: map["userName"],
    userLosts: map["userLosts"],
    userVictories: map["userVictories"],
    userPoints: map["userPoints"],
    userGames: map["userGames"],
    userID: map["userID"],
  );


  static createClassificationTable() async {
    // A simple method to create the classifications table

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.transaction((txn) => txn.execute(classificationTable));
    } else {
      final Database db = await openDatabase("uno.db");
      db.transaction((txn) => txn.execute(classificationTable));

    }


  }

  static insertEntryClassification(Classification classification) async {
    // A simple method to insert

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.insert("classifications", classification.toMap());
    } else {
      final Database db = await openDatabase("uno.db");
      db.insert("classifications", classification.toMap());
    }


  }

  static updateEntryClassification(Classification classification) async {
    // A simple method to update

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.update("classifications", classification.toMap(), where: "userName = ?", whereArgs: [classification.userName]);
    } else {
      final Database db = await openDatabase("uno.db");
      db.update("classifications", classification.toMap(), where: "userName = ?", whereArgs: [classification.userName]);
    }


  }


  static Future<List<Classification>> retrieveClassifications(String id) async {
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

    List<Map<String,dynamic>> rawClassifications = [];

    if (kIsWeb){
      // Retrieve web entries
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      rawClassifications = await db.query("classifications", columns: ['userName', 'userLosts', 'userVictories', 'userPoints', 'userGames', 'userID'], where: "userID = ?", whereArgs: [id] );
    } else {
      final Database db = await openDatabase("uno.db");
      rawClassifications = await db.query("classifications", columns: ['userName', 'userLosts', 'userVictories', 'userPoints', 'userGames', 'userID'], where: "userID = ?", whereArgs: [id] );
    }

    List<Classification> classifications  = getClassifications(rawClassifications);

    return classifications;

  }


}