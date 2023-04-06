import 'package:sqflite/sqflite.dart';

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
    final Database db = await openDatabase("uno.db");

    db.transaction((txn) => txn.execute(cardsTable));
  }

  static insertCardIntoTable(Cards card) async {
    // A method to insert a card into the database
    final Database db = await openDatabase("uno.db");

    db.insert(
        "cards",
    card.toMap());
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

    final Database db = await openDatabase("uno.db");
    List<Map<String,dynamic>> rawCards = await db.query("cards");
    List<Cards> cards = getCards(rawCards);

    cards.forEach((element) {print(element.name);});

    return cards;
  }

}