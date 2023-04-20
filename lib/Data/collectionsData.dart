import '../Screens/screens.dart';

class CollectionsData{

  static Map<String,dynamic> collections = {

    "CARDS Pocket Original" : {
      "description" :  "Cartas originales de CARDS Pocket",
      "thumbnail" :  "assets/deck/original/thumbnail.png",
    },

    "Animal Crossing" : {
      "description" : "Cartas con personajes de Animal Crossing",
      "thumbnail" :  "assets/deck/animal_crossing/thumbnail.png",
    },

    "Super Mario" : {
      "description" :  "Cartas con personajes de Super Mario",
      "thumbnail" :  "assets/deck/super_mario/thumbnail.png",
    },
  };

  static addCollectionsToDatabase() async {
    // This method create a row for each key in the map
    Collections.createCollectionsTable();

    for (String collection in collections.keys){
      Collections  currentCollection = Collections(name: collection, thumbnail: collections[collection]["thumbnail"], description: collections[collection]["description"]);
      Collections.insertCollectionIntoTable(currentCollection);
    }
  }
}