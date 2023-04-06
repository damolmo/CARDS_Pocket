import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:uno_pocket/BoardScreen/widgets/userScore.dart';
import '../Screens/screens.dart';

class BoardView extends StackedView<BoardModel>{
  @override
  BoardView({
    required this.playerOneName,
    required this.playerTwoName,
    required this.isTwoPlayersMode,
    required this.player,
    super.key,
});

  final String playerOneName;
  final String playerTwoName;
  final bool isTwoPlayersMode;
  final AudioPlayer player;


  @override
  Widget builder(
      BuildContext context,
      BoardModel viewModel,
      Widget? child
      ){

    viewModel.playerOneName =  playerOneName;
    viewModel.playerTwoName = playerTwoName;
    viewModel.isTwoPlayersMode =  isTwoPlayersMode;
    viewModel.player = player;
    viewModel.keepMusic(player, context, "keep");

    return WillPopScope(
        onWillPop: () => viewModel.preventWindowClose(),
        child : Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(238, 34, 41, 1.0),
            title: Row(
              children: [
                IconButton(
                    onPressed: (){
                      if (viewModel.isMusicPlaying){
                        print("stopped");
                        viewModel.killCurrentMusic(viewModel.player);
                        viewModel.isMusicPlaying = false;
                        viewModel.notifyListeners();
                      } else {
                        print("playing");
                        viewModel.startLoop(viewModel.player);
                        viewModel.isMusicPlaying = true;
                        viewModel.notifyListeners();
                      }

                    },
                    icon: Icon(viewModel.isMusicPlaying ? Icons.volume_up_rounded : Icons.volume_mute_rounded, color: Colors.white, size: 35,)),
                const Spacer(),
                IconButton(
                    onPressed: (){
                      var snack = SnackBar(content: Text("Función disponible próximamente", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, ), textAlign: TextAlign.center,),behavior: SnackBarBehavior.floating ,);
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                      //viewModel.saving = true;
                      //viewModel.notifyListeners();
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => SaveView(isSaveGame: true, boardModel: viewModel,)));
                    },
                    icon: Icon(Icons.save_rounded, color: Colors.white, size: 35,)),

              ],
            ),
          ),
          body: Stack(
            children: [
              // Background Theme
              if (!viewModel.userDismised && !viewModel.colorChanger)
              BackgroundTheme(),

              // UserName Widget
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger)
              UserNameWidget(viewModel: viewModel,),

              // Timer Widget
              if (!viewModel.newTurnButton  && !viewModel.userDismised && !viewModel.colorChanger)
              TimerWidget(viewModel: viewModel),

              // New Turn Button
              // Only shows if a turn comes to an end
              if (viewModel.newTurnButton  && !viewModel.userDismised)
                PlayerReady(viewModel: viewModel),

              // Current Card
              if(!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger)
              CurrentCard(viewModel: viewModel),

              // Current User Cards
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger)
                UserCards(viewModel: viewModel),

              // User Buttons
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger)
                Buttons(viewModel: viewModel,),

              // User Score
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger)
                UserScore(viewModel: viewModel),

              // Dismiss Windows
              if (viewModel.userDismised)
                DismissWindows(viewModel: viewModel, player: viewModel.player,),

              // Color Changer screen
              if (viewModel.colorChanger)
                ColorChanger(viewModel: viewModel),

            ],
          ),
        ),
    );
  }
  @override
  BoardModel viewModelBuilder(BuildContext context) => BoardModel();

}