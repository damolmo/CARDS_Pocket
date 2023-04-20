import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Settings{

  Settings({
   required this.userID,
   required this.collectionID,
});

  final String userID;
  final String collectionID;

  static const settingsTable = """
    CREATE TABLE IF NOT EXISTS settings(
      userID TEXT PRIMARY KEY,
      collectionID TEXT,
      FOREIGN KEY(userID) REFERENCES accounts(userName),
      FOREIGN KEY(collectionID) REFERENCES collections(name));
  """;

  Map<String,dynamic> toMap(){
    return{
      "userID" : userID,
      "collectionID" : collectionID,
    };
  }

  factory Settings.fromMap(Map<String,dynamic> map) => Settings(
    userID: map["userID"],
    collectionID: map["collectionID"]
  );

  static createTableSettings () async  {
    // A simple method to create settings table

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.transaction((txn) => txn.execute(settingsTable));
    } else {
      final Database db = await openDatabase("uno.db");
      db.transaction((txn) => txn.execute(settingsTable));
    }
  }

  static insertRowInSettings(Settings currentSettings) async {
    // A method to insert a row in settings

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.insert(
          "settings",
          currentSettings.toMap());
    } else {
      final Database db = await openDatabase("uno.db");
      db.insert(
          "settings",
          currentSettings.toMap());
    }
  }

  static updateSettings(Settings currentSettings) async {
    // This method is used to update current user settings
    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.update(
          "settings",
          currentSettings.toMap(),
          where: "userID = ?",
          whereArgs: [currentSettings.userID]);
    } else {
      final Database db = await openDatabase("uno.db");
      db.update(
          "settings",
          currentSettings.toMap(),
          where: "userID = ?",
          whereArgs: [currentSettings.userID]);
    }
  }

  static Future<Settings> retrieveCurrentSettings(String id) async {
    // Retrieve settings for current user
    List<Map<String,dynamic>> rawSettings = [];

    Future<Settings> getSettings(List<Map<String,dynamic>> rawSettings) async {
      return Settings.fromMap(rawSettings.first);
    }

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      rawSettings = await db.query("settings", where: "userID = ?", whereArgs: [id]);

    } else {
      final Database db = await openDatabase("uno.db");
      rawSettings = await db.query("settings", where: "userID = ?", whereArgs: [id]);
    }

    Settings currentSettings = await getSettings(rawSettings);
    return currentSettings;
  }

}