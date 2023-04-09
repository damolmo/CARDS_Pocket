import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class Cards{

  Cards({
    required this.name,
    required this.color,
    required this.value,
    required this.uri,
});

  final String name;
  final String color;
  final String value;
  final String uri;


  static const cardsTable = """
    CREATE TABLE IF NOT EXISTS cards(
      name TEXT PRIMARY KEY,
      color TEXT,
      value TEXT,
      uri TEXT);
  """;

  Map<String, dynamic> toMap(){
    return{
      "name" : name,
      "color" :  color,
      "value" :  value,
      "uri" : uri,
    };
  }

  factory Cards.fromMap(Map<String,dynamic> map) => Cards(
    name: map["name"],
    color: map["color"],
    value: map["value"],
    uri: map["uri"]
  );

  static createTable() async {
    // A simple method to create the cards table

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.transaction((txn) => txn.execute(cardsTable));
    } else {
      final Database db = await openDatabase("uno.db");
      db.transaction((txn) => txn.execute(cardsTable));
    }

  }

  static insertCardIntoTable(Cards card) async {
    // A method to insert a card into the database

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.insert("cards", card.toMap());
    } else {
      final Database db = await openDatabase("uno.db");
      db.insert("cards", card.toMap());
    }

  }

  static Future<List<Cards>> retrieveCards() async {
    // A method to retrieve cards from database
    List<Cards> getCards(List<Map<String,dynamic>> rawCards){
      // Create instances of every card
      List<Cards> cards = [];

      for (Map<String,dynamic> card in rawCards){
        Cards currentCard = Cards.fromMap(card);
        cards.add(currentCard);
      }
      return cards;
    }

    List<Map<String,dynamic>> rawCards = [];

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      rawCards = await db.query("cards");
    } else {
      final Database db = await openDatabase("uno.db");
      rawCards = await db.query("cards");
    }

    List<Cards> cards = getCards(rawCards);

    return cards;
  }

}