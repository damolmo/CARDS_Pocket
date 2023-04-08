import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:uno_pocket/BoardScreen/widgets/unoScreen.dart';
import 'package:uno_pocket/BoardScreen/widgets/userScore.dart';
import '../Screens/screens.dart';

class BoardView extends StackedView<BoardModel>{
  @override
  BoardView({
    required this.playerOneName,
    required this.playerTwoName,
    required this.playerOneScore,
    required this.playerTwoScore,
    required this.playerOneCards,
    required this.playerTwoCards,
    required this.isTwoPlayersMode,
    required this.player,
    required this.isBackup,
    super.key,
});

  final String playerOneName;
  final String playerTwoName;
  int playerOneScore;
  int playerTwoScore;
  List<Cards> playerOneCards;
  List<Cards> playerTwoCards;
  final bool isTwoPlayersMode;
  final AudioPlayer player;
  bool isBackup;


  @override
  Widget builder(
      BuildContext context,
      BoardModel viewModel,
      Widget? child
      ){

    onViewModelReady(viewModel);

    viewModel.playerOneName =  playerOneName;
    viewModel.playerTwoName = playerTwoName;
    if (isBackup){
      viewModel.playerOneScore = playerOneScore;
      viewModel.playerTwoScore = playerTwoScore;
      viewModel.playerOneCards = playerOneCards;
      viewModel.playerTwoCards = playerTwoCards;
      isBackup = false;
    }

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
                      viewModel.saving = true;
                      viewModel.notifyListeners();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SaveView(isSaveGame: true, boardModel: viewModel, player: viewModel.player)));
                    },
                    icon: Icon(Icons.save_rounded, color: Colors.white, size: 35,)),

              ],
            ),
          ),
          body: Stack(
            children: [
              // Background Theme
              if (!viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
              BackgroundTheme(),

              // UserName Widget
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
              UserNameWidget(viewModel: viewModel,),

              // Timer Widget
              if (!viewModel.newTurnButton  && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
              TimerWidget(viewModel: viewModel),

              // New Turn Button
              // Only shows if a turn comes to an end
              if (viewModel.newTurnButton  && !viewModel.userDismised && !viewModel.unoEvent)
                PlayerReady(viewModel: viewModel),

              // Current Card
              if(!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
              CurrentCard(viewModel: viewModel),

              // Current User Cards
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
                UserCards(viewModel: viewModel),

              // User Buttons
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
                Buttons(viewModel: viewModel,),

              // User Score
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
                UserScore(viewModel: viewModel),

              // Dismiss Windows
              if (viewModel.userDismised)
                DismissWindows(viewModel: viewModel, player: viewModel.player,),

              // Color Changer screen
              if (viewModel.colorChanger)
                ColorChanger(viewModel: viewModel),

              // UNO Event window
              if (viewModel.unoEvent)
                UnoScreen(viewModel: viewModel),

            ],
          ),
        ),
    );
  }
  @override
  BoardModel viewModelBuilder(BuildContext context) => BoardModel();

}