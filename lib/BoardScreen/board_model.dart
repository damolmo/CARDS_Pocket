import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import 'package:quiver/async.dart';
import '../Screens/screens.dart';
import 'dart:math';
import 'dart:io' as IO;

class BoardModel extends BaseViewModel with MusicControl implements Initialisable{

  bool isMusicPlaying = true;
  Duration roundDuration =  Duration(seconds: 30);
  Duration counter = Duration(seconds: 1);
  int currentWidgetTimer = 30;
  bool isCpuPlayerMode = true; // Second user is CPU
  bool isTwoPlayersMode = false;
  bool isPlayerOneTurn =  true;
  bool isPlayerTwoTurn = false;
  String playerOneName = "";
  String playerTwoName = "";
  bool newTurnButton = false;
  String currentCard =  "";
  String currentCardColor = "";
  String currentCardValue = "";
  List<Cards> cards = [];
  List<Cards> playerOneCards = [];
  List<Cards> playerTwoCards = [];
  int playerOneScore = 0;
  int playerTwoScore = 0;
  int availableCards = 0;
  bool playerOnePicked =  false;
  bool playerTwoPicked = false;
  bool blockCurrentUser =  false;
  bool x2Card = false;
  int x2Counter = 0;
  bool x4Card = false;
  int x4Counter  = 0;
  bool fired = false;
  bool userLaunched = false;
  AudioPlayer player = AudioPlayer();
  bool userDismised = false;
  int consumedTurn = 0;
  bool winnerDetected = false;
  String winnerName = "";
  String looserName = "";
  int winnerScore = 0 ;
  int looserScore = 0;
  bool colorChanger = false;
  late CountdownTimer countDown;
  late StreamSubscription<CountdownTimer> current;
  bool saving = false;
  bool playerOneRequestedUno = false;
  bool playerTwoRequestedUno = false;
  bool unoEvent = false;
  int unoEventAmount =  0;
  String playerUnoEventName = "";
  bool showColorChangerNotification = false;
  Color colorChanged = Colors.red;
  String colorChangedStr = "";
  String wildCardStr = "";
  bool wildCardNotification =  false;
  bool isBackup = false;

  @override
  void initialise(){
    getCards();
    youAreFired();
  }

  preventWindowClose(){
    // This method prevents quiting the game accidentally
    userDismised = true;
    notifyListeners();
  }

  youAreFired(){
    // That's it. Your time ends :)
    if (isPlayerOneTurn || isPlayerTwoTurn){
      CountdownTimer countDown =  CountdownTimer(roundDuration, counter);
      current = countDown.listen(null);

      current.onData((time) {
        if (!userDismised && !winnerDetected && !colorChanger && !saving) {
          if (currentWidgetTimer == 30) current.resume();
          if (currentWidgetTimer > 0) currentWidgetTimer -= counter.inSeconds;
          if (currentWidgetTimer == 0 || userLaunched) {
            if (x2Card || x4Card) {
              if (consumedTurn == 1){
                pickPunishmentCards();
                current.pause();
                fired = true;
                nextTurn();
                consumedTurn = 0;
                notifyListeners();
              } else {
                consumedTurn = 1;
                fired = true;
                current.pause();
                nextTurn();
                notifyListeners();
              }

            } else {
              current.pause();
              fired = true;
              nextTurn();
              notifyListeners();
            }
          }
        }
        notifyListeners();

      });
    }
  }

  getCards() async {
    // Get all cards from database
    if (IO.Platform.isMacOS || IO.Platform.isAndroid || IO.Platform.isIOS) {
      try {
      cards = await Cards.retrieveCards();
      notifyListeners();
      }
    catch (e){
        CardsData.insertCards();
        cards = await Cards.retrieveCards();
        notifyListeners();
      }
    } else {
      cards = CardsData.webAssets();
      notifyListeners();
    }

    availableCards =  cards.length;
    if (!isBackup) setCurrentCard();
    notifyListeners();
  }

  setCurrentCard(){
    // Set initial current card within all cards available
    Random random = Random();
    int index = random.nextInt(availableCards);

    while (cards[index].name.contains("Wild")){
      index = random.nextInt(availableCards);
    }

    currentCard = cards[index].uri;
    currentCardColor = cards[index].color;
    currentCardValue = cards[index].value;
    cards.removeAt(index);
    availableCards  = cards.length;
    if (!isBackup) giveUserCard();
    notifyListeners();
  }

  setCurrentCardValues(Cards card){
    // This method updates current card values with a new one
    currentCard = card.uri;
    currentCardColor = card.color;
    currentCardValue = card.value;
    notifyListeners();
  }

  updateUserValuesAfterLaunch(Cards card){
    // After launching a card, update user values
    isPlayerOneTurn ? playerOneCards.remove(card) : playerTwoCards.remove(card);
    isPlayerOneTurn ?  playerOneScore += int.parse(card.value) : playerTwoScore += int.parse(card.value);
    checkPossibleWinner();
    notifyListeners();
  }

  checkPossibleWinner(){
    // Check if we've a winner

    if (playerOneCards.length == 0 ){
      print("1");
      // We've a winner
      winnerDetected = true;
      winnerName =  playerOneName;
      looserName =  playerTwoName;
      winnerScore = playerOneScore;
      looserScore =  playerTwoScore;
      notifyListeners();
    } else if (playerTwoCards.length == 0){
      print("2");
      // We've a winner
      winnerDetected = true;
      winnerName =  playerTwoName;
      winnerScore =  playerTwoScore;
      looserScore =  playerOneScore;
      looserName = playerOneName;
      notifyListeners();
    } else if (cards.length == 0){
      print("3");
      // No remaining cards
      // User with highest score will be the winner
      if (playerOneScore > playerTwoScore){
        winnerName = playerOneName;
        looserName =  playerTwoName;
        winnerScore =  playerOneScore;
        looserScore = playerTwoScore;
        winnerDetected = true;
        notifyListeners();
      } else {
       winnerName =  playerTwoName;
       winnerScore =  playerTwoScore;
       looserName =  playerOneName;
       looserScore =  playerOneScore;
       winnerDetected = true;
       notifyListeners();
      }

    } else if (playerOneScore == 500 || playerTwoScore == 500){
      print("4");
      if (playerOneScore == 500){
        winnerName = playerOneName;
        winnerScore =  playerOneScore;
        looserName =  playerTwoName;
        looserScore =  playerTwoScore;
        winnerDetected = true;
        notifyListeners();
      } else {
        winnerName =  playerTwoName;
        winnerScore =  playerTwoScore;
        looserName = playerOneName;
        looserScore =  playerOneScore;
        winnerDetected = true;
        notifyListeners();
      }

    }
  }

  generateApplyRandomCard(bool isPlayerOne){
    // This generates and apply a random card into an user deck
    Random random = Random();
    int cardIndex = random.nextInt(availableCards);
    isPlayerOne ? playerOneCards.add(cards[cardIndex]) : playerTwoCards.add(cards[cardIndex]);

    cards.removeAt(cardIndex);
    availableCards = cards.length;
    notifyListeners();

  }

  giveUserCard(){
    // Give each user 7 cards at the start of every turn
    while (playerOneCards.length < 7){
      Random randomCard = Random();
      int randomCardIndex  =  randomCard.nextInt(availableCards);
      playerOneCards.add(cards[randomCardIndex]);
      cards.removeAt(randomCardIndex);
      availableCards = cards.length;
      notifyListeners();
    }

    while (playerTwoCards.length < 7){
      Random randomCard = Random();
      int randomCardIndex  = randomCard.nextInt(availableCards);
      playerTwoCards.add(cards[randomCardIndex]);
      cards.removeAt(randomCardIndex);
      availableCards = cards.length;
      notifyListeners();
    }

    print("Cartas Jugador 1 : ${playerOneCards}");
    print("Cartas Jugador 2 : ${playerTwoCards}");

  }

  pickCardFromDeck() async {
    // Users are able to pick a random card from deck if needed
    if (isPlayerOneTurn && !playerOnePicked && !blockCurrentUser && !fired){
      // Add card
      if (playerOneRequestedUno) playerOneRequestedUno = false;
      notifyListeners();
      Random randomCard = Random();
      int randomCardIndex  =  randomCard.nextInt(availableCards);
      playerOneCards.add(cards[randomCardIndex]);
      cards.removeAt(randomCardIndex);
      availableCards = cards.length;
      playerOnePicked = true;
      checkPossibleWinner();
      notifyListeners();
    } else if (isPlayerTwoTurn && !playerTwoPicked && !blockCurrentUser && !fired){
      // Add card
      if (playerTwoRequestedUno) playerTwoRequestedUno = false;
      notifyListeners();
      Random randomCard = Random();
      int randomCardIndex  =  randomCard.nextInt(availableCards);
      playerTwoCards.add(cards[randomCardIndex]);
      cards.removeAt(randomCardIndex);
      availableCards = cards.length;
      playerTwoPicked =  true;
      checkPossibleWinner();
      notifyListeners();
    }
  }

   pickPunishmentCards(){
    // USER MUST GET ALL CARDS ACCORDING TO PUNISHMENT

     if (x2Card){
       for (int i = 0; x2Counter == 1? i < 2 : i < 4; i++){
         if (x2Counter == 2){
           // NEXT USER GETS STRIKE
           isPlayerOneTurn ?  generateApplyRandomCard(false) :  generateApplyRandomCard(true);
         } else if (x2Counter == 1){
           // CURRENT USER GETS STRIKE
           isPlayerOneTurn && consumedTurn == 1 ?  generateApplyRandomCard(true) :  generateApplyRandomCard(false);
         }
       }
       x2Card = false;
       x2Counter = 0;
       notifyListeners();


     } else if (x4Card){
       for (int i = 0; x4Counter == 1 ?  i < 4 : i < 8; i++ ){
         if (x4Counter == 2){
           // NEXT USER GETS A STRIKE
           isPlayerOneTurn ?  generateApplyRandomCard(false) :  generateApplyRandomCard(true);
         } else if (x4Counter == 1){
           // CURRENT USER GETS A STRIKE
           isPlayerOneTurn && consumedTurn == 1 ? generateApplyRandomCard(true) : generateApplyRandomCard(false);
         }
       }

       x4Card = false;
       x4Counter = 0;
       notifyListeners();
     }
   }

   checkUnoChance(){
    // This method checks if the opposite users have just one card left
     if (isPlayerOneTurn && playerOneCards.length == 1 && !playerOneRequestedUno){
       // Good decission here ;)
       playerOneRequestedUno = true;
       notifyListeners();
     }

     else if (isPlayerTwoTurn  && playerTwoCards.length == 1 && !playerTwoRequestedUno){
       // Good decission here ;)
       playerTwoRequestedUno = true;
       notifyListeners();
     }

     else {
       if (isPlayerOneTurn) {
         // Check if player two cards
         if (playerTwoCards.length == 1 && !playerTwoRequestedUno) {
           // UNO!
           int newCards = playerOneCards.length + 1;
           unoEventAmount = newCards;
           playerUnoEventName = playerTwoName;
           unoEvent = true;
           notifyListeners();
           while (playerTwoCards.length < newCards) {
             generateApplyRandomCard(false);
           }
         }
       } else if (isPlayerTwoTurn) {
         if (playerOneCards.length == 1 && !playerOneRequestedUno) {
           //UNO!
           int newCards = playerTwoCards.length + 1;
           playerUnoEventName = playerOneName;
           unoEventAmount = newCards;
           unoEvent = true;
           notifyListeners();
           while (playerOneCards.length < newCards) {
             generateApplyRandomCard(true);
           }
         }
       }
     }
   }

  checkUserSelectedCard(Cards card){
    // This is the start of the game logic
    // UNO rules will be applied

    // PREVIOUS CARD IS A X2
    if (x2Card){
      // CURRENT USER MUST USE A X2 CARD TOO
      if (card.name.contains("x2")){
        // USER LAUNCH A X2 CARD TOO
        setCurrentCardValues(card);
        updateUserValuesAfterLaunch(card);
        x2Counter++;
        userLaunched = true;
        wildCardNotification = true;
        wildCardStr = "Se lanzó una carta x2 (2)";
        // PUNISHMENT MUST BE APPLIED
        pickPunishmentCards();
        notifyListeners();
      }
    }

    // PREVIOUS CARD IS A X4
    else if (x4Card){
      // CURRENT USER MUST USE A X4 CARD TOO
      if (card.name.contains("x4")){
        // USER LAUNCH A X4 CARD TOO
        setCurrentCardValues(card);
        updateUserValuesAfterLaunch(card);
        x4Counter++;
        userLaunched = true;
        colorChanger = true;
        wildCardNotification = true;
        wildCardStr = "Se lanzó una carta x4 (2)";
        // PUNISHMENT MUST BE APPLIED
        pickPunishmentCards();
        notifyListeners();
      }
    }

    else if (card.name.contains("x4") && !x4Card && !x2Card && !blockCurrentUser){
      // NEXT USER SHOULD USE X4 TOO
      setCurrentCardValues(card);
      updateUserValuesAfterLaunch(card);
      x4Card = true;
      x4Counter++;
      userLaunched = true;
      blockCurrentUser = true;
      colorChanger = true;
      wildCardNotification = true;
      wildCardStr = "Se lanzó una carta x4";
      notifyListeners();
      currentCardDetails();
      currentPlayerDetails();
    }

    else if (card.name.contains("Skip") || card.name.contains("Reverse") ){
        if (currentCard.contains("skip") && card.name.contains("Skip") || card.color == currentCardColor ){
          // CURRENT USER HAVE DOUBLE TURN
          setCurrentCardValues(card);
          updateUserValuesAfterLaunch(card);
          currentWidgetTimer = 30;
          isPlayerOneTurn ? playerOnePicked = false : playerTwoPicked = false;
          notifyListeners();
          currentCardDetails();
          currentPlayerDetails();

      } else if (currentCard.contains("reverse") && card.name.contains("Reverse") || card.color == currentCardColor ){
          // CURRENT USER HAVE DOUBLE TURN
          setCurrentCardValues(card);
          updateUserValuesAfterLaunch(card);
          currentWidgetTimer = 30;
          isPlayerOneTurn ? playerOnePicked = false : playerTwoPicked = false;
          notifyListeners();
          currentCardDetails();
          currentPlayerDetails();

        }
    }

    else if (card.name.contains("x2") && !x2Card && !x4Card && !blockCurrentUser){
      // NEXT USER SHOULD USE X2 TOO
      if (currentCardColor == card.color || currentCard.contains("draw_2")){
        setCurrentCardValues(card);
        updateUserValuesAfterLaunch(card);
        x2Card = true;
        x2Counter++;
        userLaunched = true;
        blockCurrentUser = true;
        wildCardNotification = true;
        wildCardStr = "Se lanzó una carta x2";
        notifyListeners();
        currentCardDetails();
        currentPlayerDetails();
      }

    }

    else if (currentCardColor == card.color && !x4Card && !x2Card && !blockCurrentUser){
      print("same color?");
      // Both cards have the same color
      // This complaints with the main rule of the game
      setCurrentCardValues(card);
      updateUserValuesAfterLaunch(card);
      currentCardDetails();
      currentPlayerDetails();
      blockCurrentUser = true;
      userLaunched = true;
      notifyListeners();
    } else if (currentCardValue == card.value && !x4Card && !x2Card && !card.name.contains("Skip") && !card.name.contains("Reverse") && !blockCurrentUser ){
      print("same value?");
      // Different color but same value
      // Passed
      setCurrentCardValues(card);
      updateUserValuesAfterLaunch(card);
      currentCardDetails();
      currentPlayerDetails();
      blockCurrentUser = true;
      userLaunched = true;
      notifyListeners();
    } else if (card.color == "wild" && !x4Card && !x2Card && !blockCurrentUser){
      // User launched a wild card
      // Show color changer screen
      setCurrentCardValues(card);
      updateUserValuesAfterLaunch(card);
      currentCardDetails();
      currentPlayerDetails();
      blockCurrentUser = true;
      userLaunched =  true;
      colorChanger = true;
      notifyListeners();
    }
  }

  resetTimer(StreamSubscription<CountdownTimer> current){
    current.resume();
    notifyListeners();
  }

  nextTurn(){
    // Some events should skip the turn, that why this method exists
    if (isPlayerOneTurn && x2Counter < 2){
      isPlayerOneTurn = false;
      isPlayerTwoTurn = true;
      newTurnButton = true;
      playerOnePicked = false;
      currentWidgetTimer = 30;
      userLaunched = false;
      fired = false;
      notifyListeners();
    } else {
      isPlayerOneTurn = true;
      isPlayerTwoTurn = false;
      newTurnButton = true;
      playerTwoPicked = false;
      currentWidgetTimer = 30;
      userLaunched = false;
      fired = false;
      notifyListeners();
    }
  }

  currentCardDetails() async {
    // This is intended for debug
    // Prints all details of current card on console

    print("""
    
    Path  : ${currentCard},
    Color : ${currentCardColor},
    Value : ${currentCardValue}
    
    """);
  }

  currentPlayerDetails(){
    // This is intended for debug
    // Prints all details of current user on console
    print("""
    Player 1 :  ${playerOneScore},
    Player 2 : ${playerTwoScore},
  """);
  }

}