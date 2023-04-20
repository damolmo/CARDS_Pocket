import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite/sqflite.dart';

class Collections{

  Collections({
    required this.name,
    required this.thumbnail,
    required this.description,
  });

  final String name;
  final String thumbnail;
  final String description;

  static const collectionsTable = """
    CREATE TABLE IF NOT EXISTS collections(
      name TEXT PRIMARY KEY,
      thumbnail TEXT,
      description TEXT);
  """;

  Map<String,dynamic> toMap() {
    return {
      "name" : name,
      "thumbnail" : thumbnail,
      "description" : description,
    };
  }

  factory Collections.fromMap(Map<String,dynamic> map) =>
      Collections(
          name: map["name"],
          thumbnail: map["thumbnail"],
          description: map["description"]);

  static createCollectionsTable() async {
    // This static method creates a table for collections

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.transaction((txn) => txn.execute(collectionsTable));
    } else {
      final Database db = await openDatabase("uno.db");
      db.transaction((txn) => txn.execute(collectionsTable));
    }
  }

  static insertCollectionIntoTable(Collections collection) async {
    // This method inserts a collection

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      db.insert(
          "collections",
          collection.toMap());
    } else {
      final Database db = await openDatabase("uno.db");
      db.insert(
          "collections",
          collection.toMap());
    }
  }

  static retrieveCollections() async {
    // This method returns all existing collections in current db

    List<Collections> getCollections(List<Map<String,dynamic>> rawCollections) {
      // Return a list of collections
      List<Collections> collections = [];

      for (Map<String,dynamic> collection in rawCollections){
        Collections currentCollection = Collections.fromMap(collection);
        collections.add(currentCollection);
      }

      return collections;
    }

    List<Map<String,dynamic>> rawCollections = [];

    if (kIsWeb){
      var factory = databaseFactoryFfiWeb;
      var db = await factory.openDatabase("uno.db");
      rawCollections = await db.query("collections");
    } else {
      final Database db = await openDatabase("uno.db");
      rawCollections = await db.query("collections");
    }

    List<Collections> collections = getCollections(rawCollections);
    return collections;
  }


}