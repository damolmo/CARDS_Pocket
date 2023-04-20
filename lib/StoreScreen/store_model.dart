import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';
import 'package:audioplayers/audioplayers.dart';

class StoreModel extends BaseViewModel implements Initialisable{

  AudioPlayer player = AudioPlayer();
  AudioPlayer homePlayer = AudioPlayer();
  String userID = "";
  Duration fullDuration = Duration();
  Duration currentDuration = Duration();
  String fullDurationStr = "";
  String fixedFullDurationStr = "";
  String currentDurationStr = "";
  List<Collections> collections = [];
  List<Cards> collectionCards = [];
  String choosedCollection = "";
  int choosedCollectionIndex =  0;
  bool showPreview = false;

  @override
  void initialise(){
    playBackgroundTheme(); // Background Music
    readCollections(); // Data

  }

  resumeMainTheme(BuildContext context) async {
    // Resume main music thread on return to home screen

    if (!showPreview){
      // First, stop music theme player
      player.pause();
      player.stop();
      notifyListeners();

      // Then, resume main player
      homePlayer.resume();

      // Navigate to home screen
      Navigator.of(context).pop();
    } else {
      showPreview = false;
      notifyListeners();
    }

  }

  compareDurations(Duration d, String type) async {
    // Format durations to Strings and compare both

    int minutes = Duration(minutes: d.inMinutes ).inMinutes;
    int seconds = Duration(seconds: d.inSeconds).inSeconds;

    if (type == "full"){
      fullDurationStr = "$minutes:$seconds";
      fixedFullDurationStr = "$minutes:${seconds - 1}";
      notifyListeners();
    } else {
      currentDurationStr = "$minutes:$seconds";
      notifyListeners();

      // Check if current position is equals to full position or near
      if (currentDurationStr == fullDurationStr || currentDurationStr == fixedFullDurationStr){
        // Stop current audio services safely and start loop again
        player.pause();
        player.stop();
        player.play(AssetSource("sounds/store.mp3"));
        notifyListeners();
      }

    }

  }

  playBackgroundTheme() async {
    // A simple method to play a background theme

    // Start playing the song
    player.play(AssetSource("sounds/store.mp3"));
    notifyListeners();

    // Listen to listeners of current song
    player.onDurationChanged.listen((Duration d) {
      fullDuration = d;
      compareDurations(d, "full");
      notifyListeners();
    });

    player.onPositionChanged.listen((Duration d) {
      currentDuration = d;
      compareDurations(d, "current");
      notifyListeners();
    });
  }

  readCollections() async {
    // A method to retrieve latest collections from database

    try {
      Collections.createCollectionsTable();
      collections = await Collections.retrieveCollections();
    } catch (e){
      print(e);
    }


    if (collections.isEmpty){
      await CollectionsData.addCollectionsToDatabase();
      collections = await Collections.retrieveCollections();
    }

    notifyListeners();
  }

  readCollectionCards(int index) async {
    // Retrieve cards for current collection

    choosedCollection = collections[index].name;
    choosedCollectionIndex = index;

    Cards.createTable();

    try {
      collectionCards = await Cards.retrieveCards(choosedCollection);
      print("Good");
    } catch (e){
     print(e);
    }

    if (collectionCards.isEmpty){
      CardsData.insertCards();
      collectionCards = await Cards.retrieveCards(choosedCollection);
      print("error");
    }

    notifyListeners();
    print("CARTAS  =>");
    collectionCards.forEach((element) {print(element.uri);});
  }

  installTheme() async {
    // This method is used to install choosed cards into user profile

    late Settings currentSettings;

    // Retrieve Settings if any
    try {
      Settings.createTableSettings();
      currentSettings = await Settings.retrieveCurrentSettings(userID);
      notifyListeners();
    } catch (e){
      print(e);
    }

    if (currentSettings.userID.isEmpty){
      // Create a new entry
      Settings newSettings = Settings(
          userID: userID,
          collectionID: choosedCollection);
      Settings.insertRowInSettings(newSettings);
    } else {
      Settings updateSettings = Settings(
          userID: userID,
          collectionID: choosedCollection);
      Settings.updateSettings(updateSettings);
    }
  }
}