import 'dart:io' as IO;
import 'dart:html';
import 'package:platform/platform.dart';
import 'package:uno_pocket/DataBases/cards.dart';

class CardsData{

  static Map<String,dynamic> cards = {
    "blue" : {
      "0 Azul" : ["azul", "0", "assets/deck/blue/0.png"],
      "1 Azul" : ["azul", "1", "assets/deck/blue/1.png"],
      "2 Azul" : ["azul", "2", "assets/deck/blue/2.png"],
      "3 Azul" : ["azul", "3", "assets/deck/blue/3.png"],
      "4 Azul" : ["azul", "4", "assets/deck/blue/4.png"],
      "5 Azul" : ["azul", "5", "assets/deck/blue/5.png"],
      "6 Azul" : ["azul", "6", "assets/deck/blue/6.png"],
      "7 Azul" : ["azul", "7", "assets/deck/blue/7.png"],
      "8 Azul" : ["azul", "8", "assets/deck/blue/8.png"],
      "9 Azul" : ["azul", "9", "assets/deck/blue/9.png"],
      "x2 Azul" : ["azul", "20", "assets/deck/blue/draw_2.png"],
      "Reverse Azul" : ["azul", "20", "assets/deck/blue/reverse.png"],
      "Skip Azul" : ["azul", "20", "assets/deck/blue/skip.png"],
    },

    "green" : {
      "0 Verde" : ["verde", "0", "assets/deck/green/0.png"],
      "1 Verde" : ["verde", "1", "assets/deck/green/1.png"],
      "2 Verde" : ["verde", "2", "assets/deck/green/2.png"],
      "3 Verde" : ["verde", "3", "assets/deck/green/3.png"],
      "4 Verde" : ["verde", "4", "assets/deck/green/4.png"],
      "5 Verde" : ["verde", "5", "assets/deck/green/5.png"],
      "6 Verde" : ["verde", "6", "assets/deck/green/6.png"],
      "7 Verde" : ["verde", "7", "assets/deck/green/7.png"],
      "8 Verde" : ["verde", "8", "assets/deck/green/8.png"],
      "9 Verde" : ["verde", "9", "assets/deck/green/9.png"],
      "x2 Verde" : ["verde", "20", "assets/deck/green/draw_2.png"],
      "Reverse Verde" : ["verde", "20", "assets/deck/green/reverse.png"],
      "Skip Verde" : ["verde", "20", "assets/deck/green/skip.png"],
    },

    "orange" : {
      "0 Naranja" : ["naranja", "0", "assets/deck/orange/0.png"],
      "1 Naranja" : ["naranja", "1", "assets/deck/orange/1.png"],
      "2 Naranja" : ["naranja", "2", "assets/deck/orange/2.png"],
      "3 Naranja" : ["naranja", "3", "assets/deck/orange/3.png"],
      "4 Naranja" : ["naranja", "4", "assets/deck/orange/4.png"],
      "5 Naranja" : ["naranja", "5", "assets/deck/orange/5.png"],
      "6 Naranja" : ["naranja", "6", "assets/deck/orange/6.png"],
      "7 Naranja" : ["naranja", "7", "assets/deck/orange/7.png"],
      "8 Naranja" : ["naranja", "8", "assets/deck/orange/8.png"],
      "9 Naranja" : ["naranja", "9", "assets/deck/orange/9.png"],
      "x2 Naranja" : ["naranja", "20", "assets/deck/orange/draw_2.png"],
      "Reverse Naranja" : ["naranja", "20", "assets/deck/orange/reverse.png"],
      "Skip Naranja" : ["naranja", "20", "assets/deck/orange/skip.png"],
    },

    "red" : {
      "0 Rojo" : ["rojo", "0", "assets/deck/red/0.png"],
      "1 Rojo" : ["rojo", "1", "assets/deck/red/1.png"],
      "2 Rojo" : ["rojo", "2", "assets/deck/red/2.png"],
      "3 Rojo" : ["rojo", "3", "assets/deck/red/3.png"],
      "4 Rojo" : ["rojo", "4", "assets/deck/red/4.png"],
      "5 Rojo" : ["rojo", "5", "assets/deck/red/5.png"],
      "6 Rojo" : ["rojo", "6", "assets/deck/red/6.png"],
      "7 Rojo" : ["rojo", "7", "assets/deck/red/7.png"],
      "8 Rojo" : ["rojo", "8", "assets/deck/red/8.png"],
      "9 Rojo" : ["rojo", "9", "assets/deck/red/9.png"],
      "x2 Rojo" : ["rojo", "20", "assets/deck/red/draw_2.png"],
      "Reverse Rojo" : ["rojo", "20", "assets/deck/red/reverse.png"],
      "Skip Rojo" : ["rojo", "20", "assets/deck/red/skip.png"],
    },

    "wild" : {
      "Wild" : ["wild", "50", "assets/deck/wild/wild.png"],
      "Wild x4" : ["wild", "50", "assets/deck/wild/wild_draw_4.png"],
    },
  };

  static Map<String,dynamic> cards_web = {
    "blue" : {
      "0 Azul" : ["azul", "0", "assets/assets/deck/blue/0.png"],
      "1 Azul" : ["azul", "1", "assets/assets/deck/blue/1.png"],
      "2 Azul" : ["azul", "2", "assets/assets/deck/blue/2.png"],
      "3 Azul" : ["azul", "3", "assets/assets/deck/blue/3.png"],
      "4 Azul" : ["azul", "4", "assets/assets/deck/blue/4.png"],
      "5 Azul" : ["azul", "5", "assets/assets/deck/blue/5.png"],
      "6 Azul" : ["azul", "6", "assets/assets/deck/blue/6.png"],
      "7 Azul" : ["azul", "7", "assets/assets/deck/blue/7.png"],
      "8 Azul" : ["azul", "8", "assets/assets/deck/blue/8.png"],
      "9 Azul" : ["azul", "9", "assets/assets/deck/blue/9.png"],
      "x2 Azul" : ["azul", "20", "assets/assets/deck/blue/draw_2.png"],
      "Reverse Azul" : ["azul", "20", "assets/assets/deck/blue/reverse.png"],
      "Skip Azul" : ["azul", "20", "assets/assets/deck/blue/skip.png"],
    },

    "green" : {
      "0 Verde" : ["verde", "0", "assets/assets/deck/green/0.png"],
      "1 Verde" : ["verde", "1", "assets/assets/deck/green/1.png"],
      "2 Verde" : ["verde", "2", "assets/assets/deck/green/2.png"],
      "3 Verde" : ["verde", "3", "assets/assets/deck/green/3.png"],
      "4 Verde" : ["verde", "4", "assets/assets/deck/green/4.png"],
      "5 Verde" : ["verde", "5", "assets/assets/deck/green/5.png"],
      "6 Verde" : ["verde", "6", "assets/assets/deck/green/6.png"],
      "7 Verde" : ["verde", "7", "assets/assets/deck/green/7.png"],
      "8 Verde" : ["verde", "8", "assets/assets/deck/green/8.png"],
      "9 Verde" : ["verde", "9", "assets/assets/deck/green/9.png"],
      "x2 Verde" : ["verde", "20", "assets/assets/deck/green/draw_2.png"],
      "Reverse Verde" : ["verde", "20", "assets/assets/deck/green/reverse.png"],
      "Skip Verde" : ["verde", "20", "assets/assets/deck/green/skip.png"],
    },

    "orange" : {
      "0 Naranja" : ["naranja", "0", "assets/assets/deck/orange/0.png"],
      "1 Naranja" : ["naranja", "1", "assets/assets/deck/orange/1.png"],
      "2 Naranja" : ["naranja", "2", "assets/assets/deck/orange/2.png"],
      "3 Naranja" : ["naranja", "3", "assets/assets/deck/orange/3.png"],
      "4 Naranja" : ["naranja", "4", "assets/assets/deck/orange/4.png"],
      "5 Naranja" : ["naranja", "5", "assets/assets/deck/orange/5.png"],
      "6 Naranja" : ["naranja", "6", "assets/assets/deck/orange/6.png"],
      "7 Naranja" : ["naranja", "7", "assets/assets/deck/orange/7.png"],
      "8 Naranja" : ["naranja", "8", "assets/assets/deck/orange/8.png"],
      "9 Naranja" : ["naranja", "9", "assets/assets/deck/orange/9.png"],
      "x2 Naranja" : ["naranja", "20", "assets/assets/deck/orange/draw_2.png"],
      "Reverse Naranja" : ["naranja", "20", "assets/assets/deck/orange/reverse.png"],
      "Skip Naranja" : ["naranja", "20", "assets/assets/deck/orange/skip.png"],
    },

    "red" : {
      "0 Rojo" : ["rojo", "0", "assets/assets/deck/red/0.png"],
      "1 Rojo" : ["rojo", "1", "assets/assets/deck/red/1.png"],
      "2 Rojo" : ["rojo", "2", "assets/assets/deck/red/2.png"],
      "3 Rojo" : ["rojo", "3", "assets/assets/deck/red/3.png"],
      "4 Rojo" : ["rojo", "4", "assets/assets/deck/red/4.png"],
      "5 Rojo" : ["rojo", "5", "assets/assets/deck/red/5.png"],
      "6 Rojo" : ["rojo", "6", "assets/assets/deck/red/6.png"],
      "7 Rojo" : ["rojo", "7", "assets/assets/deck/red/7.png"],
      "8 Rojo" : ["rojo", "8", "assets/assets/deck/red/8.png"],
      "9 Rojo" : ["rojo", "9", "assets/assets/deck/red/9.png"],
      "x2 Rojo" : ["rojo", "20", "assets/assets/deck/red/draw_2.png"],
      "Reverse Rojo" : ["rojo", "20", "assets/assets/deck/red/reverse.png"],
      "Skip Rojo" : ["rojo", "20", "assets/assets/deck/red/skip.png"],
    },

    "wild" : {
      "Wild" : ["wild", "50", "assets/assets/deck/wild/wild.png"],
      "Wild x4" : ["wild", "50", "assets/assets/deck/wild/wild_draw_4.png"],
    },
  };

  static insertCards(){
    // This method creates a card for each value in Hash Map

    Cards.createTable(); // Create table
    Map<String,dynamic> map = cards_web;

    if (IO.Platform.isAndroid || IO.Platform.isIOS || IO.Platform.isMacOS){
       map = cards;
    } else {
      map = cards_web;
    }

    for (String category in map.keys){
      for (String card in map[category].keys){
        Cards currentCard = Cards(
          name: card,
          color: map[category][card][0],
          value: map[category][card][1],
          uri: map[category][card][2]);
        Cards.insertCardIntoTable(currentCard);
      }
    }
  }
}