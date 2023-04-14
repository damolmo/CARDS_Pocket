import 'package:audioplayers/audioplayers.dart';
import 'package:stacked/stacked.dart';
import '../Screens/screens.dart';

class ClassificationModel extends BaseViewModel with MusicControl implements Initialisable{

  List<Classification> classifications = [];
  AudioPlayer player = AudioPlayer();
  late String userName;

  @override
  void initialise(){
  }

  getClassifications() async {
    // A method that runs on init to recover current classifications

    print("classifications userName ? $userName");

    try {
      classifications = await Classification.retrieveClassifications(userName);
      notifyListeners();
      print(classifications.length);
    }
    catch (e) {
      Classification.createClassificationTable();
      classifications = await Classification.retrieveClassifications(userName);

    }
  }



}