import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Accounts{

  Accounts({
    required this.userName,
    required this.userPassword,
});

  final String userName;
  final String userPassword;

  static const accountsTable = """
    CREATE TABLE IF NOT EXISTS accounts(
      userName TEXT PRIMARY KEY,
      userPassword TEXT);
  """;

  Map<String,dynamic> toMap(){
    return {
      "userName" :  userName,
      "userPassword" : userPassword,
    };
  }

  factory Accounts.fromMap(Map<String,dynamic> map) => Accounts(
      userName: map["userName"],
      userPassword: map["userPassword"]);

  static createAccountsTable() async {
    // This static method creates the accounts table for all platforms

    if(kIsWeb){
      // Create account for web browser
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.transaction((txn) => txn.execute(accountsTable));
    } else {
      final Database db = await openDatabase("uno.db");
      db.transaction((txn) => txn.execute(accountsTable));
    }
  }

  static insertAccountEntry(Accounts account) async {
    // This static method gives user control to insert new entries
    if (kIsWeb){
      // Insert according to web
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.insert("accounts", account.toMap());
    } else {
      final Database db = await openDatabase("uno.db");
      db.insert("accounts", account.toMap());
    }
  }

  static Future<List<Accounts>> retrieveAccountEntries() async {
    // Static method to retrieve all existing accounts entries

    List<Accounts> getAccounts(List<Map<String,dynamic>> rawAccounts){
      List<Accounts> accounts = [];

      for (Map<String,dynamic> account in rawAccounts){
        Accounts currentAccount = Accounts.fromMap(account);
        accounts.add(currentAccount);
      }

      return accounts;
    }

    List<Map<String,dynamic>> rawAccounts  = [];
    List<Accounts> accounts =  [];

    if (kIsWeb){
      // Recover web accounts
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      rawAccounts = await db.query("accounts");
    } else {
      final Database db = await openDatabase("uno.db");
      rawAccounts = await db.query("accounts");
    }

    accounts = getAccounts(rawAccounts);
    return accounts;
  }

}