import '../Screens/screens.dart';

class CollectionsData{

  static Map<String,dynamic> collections = {

    "CARDS_Pocket_Original" : {
      "description" :  "Cartas originales de CARDS Pocket",
      "thumbnail" :  "assets/deck/CARDS_Pocket_Original/thumbnail.png",
      "deck" : "assets/deck/CARDS_Pocket_Original/deck.png",
      "theme" :  "assets/deck/CARDS_Pocket_Original/theme.mp3",
    },

    "Animal_Crossing" : {
      "description" : "Cartas con personajes de Animal Crossing",
      "thumbnail" :  "assets/deck/Animal_Crossing/thumbnail.png",
      "deck" : "assets/deck/Animal_Crossing/deck.png",
      "theme" :  "assets/deck/Animal_Crossing/theme.mp3",
  },

    "Super_Mario" : {
      "description" :  "Cartas con personajes de Super Mario",
      "thumbnail" :  "assets/deck/Super_Mario/thumbnail.png",
      "deck" : "assets/deck/Super_Mario/deck.png",
      "theme" :  "assets/deck/Super_Mario/theme.mp3",
    },

    "Pokemon" : {
      "description" :  "Cartas con personajes de Pokémon",
      "thumbnail" : "assets/deck/Pokemon/thumbnail.png",
      "deck" : "assets/deck/Pokemon/deck.png",
      "theme" :  "assets/deck/Pokemon/theme.mp3",
    },

    "The Legend of Zelda" : {
      "description" : "",
      "thumbnail" :  "assets/deck/Zelda/thumbnail.png",
      "deck" : "assets/deck/Zelda/deck.png",
      "theme" :  "assets/deck/Zelda/theme.mp3",
    }
  };

  static addCollectionsToDatabase() async {
    // This method create a row for each key in the map
    Collections.createCollectionsTable();

    for (String collection in collections.keys){
      Collections  currentCollection = Collections(name: collection, thumbnail: collections[collection]["thumbnail"], description: collections[collection]["description"], deck: collections[collection]["deck"], theme: collections[collection]["theme"]);
      Collections.insertCollectionIntoTable(currentCollection);
    }
  }

  static retrieveCollections() {
    // A method to retrieve available collections objects without insert

    List<Collections> collectionsList = [];

    for (String collection in collections.keys){
      Collections current = Collections(name: collection, thumbnail: collections[collection]["thumbnail"], description: collections[collection]["description"], deck: collections[collection]["deck"], theme: collections[collection]["theme"]);
      collectionsList.add(current);
    }

    return collectionsList;

  }

  static addNewCollectionsToTable(List<Collections> remaining) async {
    // A method for adding new collections

    for (Collections collection in remaining){
      Collections.insertCollectionIntoTable(collection);
    }
  }
}