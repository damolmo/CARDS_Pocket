import 'package:stacked/stacked.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:uno_pocket/musicControl.dart';
import '../Screens/screens.dart';

class WinnerModel extends BaseViewModel with MusicControl implements Initialisable{

  AudioPlayer player = AudioPlayer();
  List<Classification> winners  = [];
  String winnerName = "";
  String looseName =  "";
  int winnerScore = 0;
  int looserScore = 0;
  bool isTwoPlayersMode = false;

  @override
  void initialise(){
    playWinnerTheme();
  }

  playWinnerTheme() {
    // This plays once when a user wins
    player.play(AssetSource("sounds/winner.mp3"));
  }

  addWinnerToRanking() async {
    // Add current winner to clasification screen

    try {
      winners = await Classification.retrieveClassifications();
      notifyListeners();

      if (winners.isNotEmpty){
        incrementExistingUsers();
      } else {
        addNewUsers();
      }

    }
    catch (e) {
      addNewUsers();
    }
  }

    addNewUsers() {

    try {
      Classification.createClassificationTable();
    } catch (e){
      print(e);
      }

      print("hubo un error");
      Classification newWinner = Classification(userName: winnerName, userLosts: 0, userVictories: 1, userPoints: winnerScore, userGames: 1);
      Classification.insertEntryClassification(newWinner);
      Classification newLooser = Classification(userName: looseName, userLosts: 1, userVictories: 0, userPoints: looserScore, userGames: 1);
      Classification.insertEntryClassification(newLooser);
    }

    incrementExistingUsers() async {
      bool winnerExists = false;
      bool looserExists = false;

      for (Classification winner in winners) {
        if (winner.userName == winnerName) {
          // Same user
          // Increment winner values
          Classification currentWinner = Classification(
              userName: winner.userName,
              userLosts: winner.userLosts,
              userVictories: winner.userVictories + 1,
              userPoints: winner.userPoints + winnerScore,
              userGames: winner.userGames + 1);
          Classification.updateEntryClassification(currentWinner);
          winnerExists = true;
          notifyListeners();
        }

        if (winner.userName == looseName) {
          // Same user
          // Increment looser values
          Classification currentLooser = Classification(
              userName: winner.userName,
              userLosts: winner.userLosts + 1,
              userVictories: winner.userVictories,
              userPoints: winner.userPoints + looserScore,
              userGames: winner.userGames + 1);
          Classification.updateEntryClassification(currentLooser);
          looserExists = true;
          notifyListeners();
        }

        if (!winnerExists) {
          Classification newWinner = Classification(userName: winnerName,
              userLosts: 0,
              userVictories: 1,
              userPoints: winnerScore,
              userGames: 1);
          Classification.insertEntryClassification(newWinner);
        }

        if (!looserExists) {
          Classification newLooser = Classification(userName: looseName,
              userLosts: 1,
              userVictories: 0,
              userPoints: looserScore,
              userGames: 1);
          Classification.insertEntryClassification(newLooser);
        }
      }
    }


}