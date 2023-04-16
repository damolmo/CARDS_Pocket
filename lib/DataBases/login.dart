import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Login{

  Login({
    required this.userID,
});

  final String userID;

  static const loginTable = """
    CREATE TABLE IF NOT EXISTS login(
      userID TEXT PRIMARY KEY,
      FOREIGN KEY(userID) REFERENCES accounts(userID));
  """;

  Map<String,dynamic> toMap(){
    return {
      "userID" : userID,
    };
  }

  factory Login.fromMap(Map<String,dynamic> map) => Login(
      userID: map["userID"]);

  static createLoginTable() async {
    // This static method creates a new table for login

    if (kIsWeb){
      // Current platform is web
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.transaction((txn) => txn.execute(loginTable));
    } else {
      // Current platform is not web
      final Database db = await openDatabase("uno.db");
      db.transaction((txn) => txn.execute(loginTable));
    }
  }

  static insertLogin(Login login) async {
    // This static method inserts a new login entry

    if (kIsWeb){
      // Current platform is web
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.insert("login", login.toMap());
    } else {
      //  Current platform is not web
      final Database db = await openDatabase("uno.db");
      db.insert("login", login.toMap());
    }
  }

  static deleteLogin(Login login) async {
    // This static method deletes current login entry

    if (kIsWeb){
      // Current platform is web
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.delete(
        "login",
        where: "userID = ?",
        whereArgs: [login.userID]
      );
    } else {
      // Current platform is not web
      final Database db = await openDatabase("uno.db");
      db.delete(
        "login",
        where : "userID = ?",
        whereArgs: [login.userID]
      );
    }
  }

  static Future<Login> retrieveCurrentLogin() async {
    // This static method retrieves current login if any

   Login getCurrentLogin(List<Map<String,dynamic>> rawLogin) {
     Login currentLogin = Login(userID: "");

     if (rawLogin.isNotEmpty){
       currentLogin = Login.fromMap(rawLogin.first);
       }
     return currentLogin;

    }

    List<Map<String,dynamic>> rawLogin = [];
    late Login currentLogin;

    if (kIsWeb){
      // Current platform is web
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      rawLogin = await db.query("login");
    } else {
      // Current platform is not web
      final Database db = await openDatabase("uno.db");
      rawLogin = await db.query("login");
    }

    currentLogin = getCurrentLogin(rawLogin);
    return currentLogin;
  }
}