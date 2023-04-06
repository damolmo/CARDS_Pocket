import 'package:audioplayers/audioplayers.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';

class ClassificationModel extends BaseViewModel with MusicControl implements Initialisable{

  List<Classification> classifications = [];
  AudioPlayer player = AudioPlayer();

  @override
  void initialise(){
    getClassifications();
  }

  getClassifications() async {
    // A method that runs on init to recover current classifications
    try {
      classifications = await Classification.retrieveClassifications();
      notifyListeners();
      print(classifications.length);
    }
    catch (e) {
      Classification.createClassificationTable();
      classifications = await Classification.retrieveClassifications();

    }
  }



}