import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'Screens/screens.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicControl {

  Duration fullTrackDuration = Duration();
  Duration currentTrackPosition = Duration();
  String currentTrackPositionStr =  "";
  String fullTrackDurationStr =  "";
  String fixedMusicPositionStr = "";
  String fixedMusicPositionStr2 = "";
  String musicSource = "sounds/theme.mp3";

  setCustomTheme(String path){
    // A method to set a custom theme for soundtrack
    musicSource = path;
  }

  playCurrentMusic(AudioPlayer player){
    // Start playing the music
    player.play(AssetSource(musicSource));
  }

  pauseCurrentMusic(AudioPlayer player){
    // Allow to pause current player
    player.pause();
  }

  resumeCurrentMusic(AudioPlayer player){
    // Allow to resumen current player
    player.resume();
  }

  killCurrentMusic(AudioPlayer player){
    // Completely kill current player
    player.stop();
  }

  keepMusic(AudioPlayer player, BuildContext context, String type){
    pauseCurrentMusic(player);
    resumeCurrentMusic(player);
    if (type == "return") Navigator.pop(context);
  }

  startLoop(AudioPlayer player){
    // We'll preserve current player

    checkIfSongFinished(String type, Duration d){
      // Checks and compares current track pos with total
      // Save total duration to string

      int rawMinutes = Duration(milliseconds: d.inMilliseconds).inMinutes;
      int rawSeconds = Duration(milliseconds: d.inMilliseconds).inSeconds;

      if (type == "full"){
        fullTrackDurationStr = "$rawMinutes:$rawSeconds";
        fixedMusicPositionStr =  "$rawMinutes:${rawSeconds - 1}";
        fixedMusicPositionStr2 =  "$rawMinutes:${rawSeconds + 1}";

      }
      else if (type == "current"){
        currentTrackPositionStr = "$rawMinutes:$rawSeconds";
        if (currentTrackPositionStr == fullTrackDurationStr || currentTrackPositionStr == fixedMusicPositionStr || currentTrackPositionStr ==  fixedMusicPositionStr2){
          // Reset and start the loop :)
          print("passed");
          pauseCurrentMusic(player);
          killCurrentMusic(player);
          playCurrentMusic(player);
        }
      }
    }

    playCurrentMusic(player);

    // Open listeners
    player.onDurationChanged.listen((Duration d) {
      fullTrackDuration = d;
      checkIfSongFinished("full", fullTrackDuration);
    });

    player.onPositionChanged.listen((Duration d) {
      currentTrackPosition = d;
      checkIfSongFinished("current", currentTrackPosition);
    });
  }



}