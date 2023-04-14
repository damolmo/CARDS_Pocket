import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
    required this.currentCard,
    required this.currentCardColor,
    required this.currentCardValue,
    required this.player,
    required this.isBackup,
    required this.userName,
    super.key,
});

  final String playerOneName;
  final String playerTwoName;
  final String currentCard;
  final String currentCardColor;
  final String currentCardValue;
  int playerOneScore;
  int playerTwoScore;
  List<Cards> playerOneCards;
  List<Cards> playerTwoCards;
  final bool isTwoPlayersMode;
  final AudioPlayer player;
  bool isBackup;
  final String userName;


  @override
  Widget builder(
      BuildContext context,
      BoardModel viewModel,
      Widget? child
      ){

    onViewModelReady(viewModel);

    viewModel.playerOneName =  playerOneName;
    viewModel.playerTwoName = playerTwoName;

    if (!isBackup){
      viewModel.context = context;
      viewModel.userName = userName;
    }

    if (isBackup){
      viewModel.playerOneScore = playerOneScore;
      viewModel.playerTwoScore = playerTwoScore;
      viewModel.playerOneCards = playerOneCards;
      viewModel.playerTwoCards = playerTwoCards;
      viewModel.currentCard = currentCard;
      viewModel.currentCardColor = currentCardColor;
      viewModel.currentCardValue = currentCardValue;
      viewModel.isBackup = isBackup;
      if (kIsWeb) viewModel.isMusicPlaying = false; // By default isn't initialized on web, requires user action
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
            backgroundColor: viewModel.isPlayerOneTurn ? Color.fromRGBO(238, 34, 41, 1.0) : Color.fromRGBO(9, 86, 191, 1.0)  ,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SaveView(isSaveGame: true, boardModel: viewModel, player: viewModel.player, userName: viewModel.userName,)));
                    },
                    icon: Icon(Icons.save_rounded, color: Colors.white, size: 35,)),

              ],
            ),
          ),
          body: Stack(
            children: [
              // Background Theme
              if (!viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerOneTurn && !viewModel.isTwoPlayersMode) BackgroundTheme(),
                if (viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && !viewModel.isTwoPlayersMode ) BackgroundTheme(const Color.fromRGBO(9, 86, 191, 1.0)),


              // UserName Widget
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
               UserNameWidget(viewModel: viewModel,),

              // Timer Widget
              if (!viewModel.newTurnButton  && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerOneTurn && !viewModel.isTwoPlayersMode ) TimerWidget(viewModel: viewModel),

              // New Turn Button
              // Only shows if a turn comes to an end
              if (viewModel.newTurnButton  && !viewModel.userDismised && !viewModel.unoEvent)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode ) PlayerReady(viewModel: viewModel),

              // Current Card
              if(!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
                CurrentCard(viewModel: viewModel),

              // Current User Cards
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
                UserCards(viewModel: viewModel),

              // User Buttons
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerOneTurn && !viewModel.isTwoPlayersMode ) Buttons(viewModel: viewModel,),

              // User Score
              if (!viewModel.newTurnButton && !viewModel.userDismised && !viewModel.colorChanger && !viewModel.unoEvent)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerOneTurn && !viewModel.isTwoPlayersMode ) UserScore(viewModel: viewModel),

              // Dismiss Windows
              if (viewModel.userDismised)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerOneTurn && !viewModel.isTwoPlayersMode ) DismissWindows(viewModel: viewModel, player: viewModel.player,),

              // Color Changer screen
              if (viewModel.colorChanger)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerOneTurn && !viewModel.isTwoPlayersMode ) ColorChanger(viewModel: viewModel),

              // UNO Event window
              if (viewModel.unoEvent)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerOneTurn && !viewModel.isTwoPlayersMode ) UnoScreen(viewModel: viewModel),

              // Show Color Changed Notification
              if (viewModel.showColorChangerNotification && !viewModel.newTurnButton)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerOneTurn && !viewModel.isTwoPlayersMode ) ColorChangerNotification(viewModel: viewModel),

              // Show Wild card notification
              if (viewModel.wildCardNotification && !viewModel.newTurnButton && !viewModel.colorChanger)
                if (viewModel.isPlayerOneTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerTwoTurn && viewModel.isTwoPlayersMode || viewModel.isPlayerOneTurn && !viewModel.isTwoPlayersMode ) WildCardNotification(viewModel: viewModel),

              // Show Roby Screen
              if (viewModel.showRobyMessage)
                RobyChoosedCardDialog(viewModel: viewModel),

            ],
          ),
        ),
    );
  }
  @override
  BoardModel viewModelBuilder(BuildContext context) => BoardModel();

}