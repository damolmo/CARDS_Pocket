import 'package:stacked/stacked.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:uno_pocket/Data/cardsData.dart';
import 'package:uno_pocket/Data/collectionsData.dart';
import 'package:uno_pocket/DataBases/cards.dart';
import 'package:uno_pocket/DataBases/collections.dart';
import 'package:uno_pocket/musicControl.dart';

class TitleModel extends BaseViewModel with MusicControl implements Initialisable{

  AudioPlayer player = AudioPlayer();
  late String userName;
  bool logoutScreen = false;

  @override
  void initialise(){
    startLoop(player);
    updateExistingCollections();
  }

  updateExistingCollections() async {
    // A method to update existing cards collections
    // Checks if database is created first
    List<Collections> installedCollections = [];
    List<Collections> availableCollections = CollectionsData.retrieveCollections();
    List<Collections> pending = [];

    try {
      installedCollections = await Collections.retrieveCollections();
    } catch (e){
      // No collections founds!
      installedCollections = [];
    }

    if (installedCollections.isNotEmpty){
      // Check if collections size is equals to current

      if (installedCollections.length != availableCollections.length){
        // New collections are available

        for (Collections collection in availableCollections){
          if (!installedCollections.contains(collection)){
            pending.add(collection);
          }
        }

        // Insert new collections
        CollectionsData.addNewCollectionsToTable(pending);
      }
    }
  }
}