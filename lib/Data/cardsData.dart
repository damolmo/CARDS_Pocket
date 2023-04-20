import 'dart:io' as IO;
import 'package:platform/platform.dart';
import 'package:uno_pocket/DataBases/cards.dart';

class CardsData{

  static Map<String,dynamic> cards = {

  "CARDS Pocket Original" : {
    "blue" : {
      "0 Azul" : ["azul", "0", "assets/deck/original/blue/0.png"],
      "1 Azul" : ["azul", "1", "assets/deck/original/blue/1.png"],
      "2 Azul" : ["azul", "2", "assets/deck/original/blue/2.png"],
      "3 Azul" : ["azul", "3", "assets/deck/original/blue/3.png"],
      "4 Azul" : ["azul", "4", "assets/deck/original/blue/4.png"],
      "5 Azul" : ["azul", "5", "assets/deck/original/blue/5.png"],
      "6 Azul" : ["azul", "6", "assets/deck/original/blue/6.png"],
      "7 Azul" : ["azul", "7", "assets/deck/original/blue/7.png"],
      "8 Azul" : ["azul", "8", "assets/deck/original/blue/8.png"],
      "9 Azul" : ["azul", "9", "assets/deck/original/blue/9.png"],
      "x2 Azul" : ["azul", "20", "assets/deck/original/blue/draw_2.png"],
      "Reverse Azul" : ["azul", "20", "assets/deck/original/blue/reverse.png"],
      "Skip Azul" : ["azul", "20", "assets/deck/original/blue/skip.png"],
    },

    "green" : {
      "0 Verde" : ["verde", "0", "assets/deck/original/green/0.png"],
      "1 Verde" : ["verde", "1", "assets/deck/original/green/1.png"],
      "2 Verde" : ["verde", "2", "assets/deck/original/green/2.png"],
      "3 Verde" : ["verde", "3", "assets/deck/original/green/3.png"],
      "4 Verde" : ["verde", "4", "assets/deck/original/green/4.png"],
      "5 Verde" : ["verde", "5", "assets/deck/original/green/5.png"],
      "6 Verde" : ["verde", "6", "assets/deck/original/green/6.png"],
      "7 Verde" : ["verde", "7", "assets/deck/original/green/7.png"],
      "8 Verde" : ["verde", "8", "assets/deck/original/green/8.png"],
      "9 Verde" : ["verde", "9", "assets/deck/original/green/9.png"],
      "x2 Verde" : ["verde", "20", "assets/deck/original/green/draw_2.png"],
      "Reverse Verde" : ["verde", "20", "assets/deck/original/green/reverse.png"],
      "Skip Verde" : ["verde", "20", "assets/deck/original/green/skip.png"],
    },

    "orange" : {
      "0 Naranja" : ["naranja", "0", "assets/deck/original/orange/0.png"],
      "1 Naranja" : ["naranja", "1", "assets/deck/original/orange/1.png"],
      "2 Naranja" : ["naranja", "2", "assets/deck/original/orange/2.png"],
      "3 Naranja" : ["naranja", "3", "assets/deck/original/orange/3.png"],
      "4 Naranja" : ["naranja", "4", "assets/deck/original/orange/4.png"],
      "5 Naranja" : ["naranja", "5", "assets/deck/original/orange/5.png"],
      "6 Naranja" : ["naranja", "6", "assets/deck/original/orange/6.png"],
      "7 Naranja" : ["naranja", "7", "assets/deck/original/orange/7.png"],
      "8 Naranja" : ["naranja", "8", "assets/deck/original/orange/8.png"],
      "9 Naranja" : ["naranja", "9", "assets/deck/original/orange/9.png"],
      "x2 Naranja" : ["naranja", "20", "assets/deck/original/orange/draw_2.png"],
      "Reverse Naranja" : ["naranja", "20", "assets/deck/original/orange/reverse.png"],
      "Skip Naranja" : ["naranja", "20", "assets/deck/original/orange/skip.png"],
    },

    "red" : {
      "0 Rojo" : ["rojo", "0", "assets/deck/original/red/0.png"],
      "1 Rojo" : ["rojo", "1", "assets/deck/original/red/1.png"],
      "2 Rojo" : ["rojo", "2", "assets/deck/original/red/2.png"],
      "3 Rojo" : ["rojo", "3", "assets/deck/original/red/3.png"],
      "4 Rojo" : ["rojo", "4", "assets/deck/original/red/4.png"],
      "5 Rojo" : ["rojo", "5", "assets/deck/original/red/5.png"],
      "6 Rojo" : ["rojo", "6", "assets/deck/original/red/6.png"],
      "7 Rojo" : ["rojo", "7", "assets/deck/original/red/7.png"],
      "8 Rojo" : ["rojo", "8", "assets/deck/original/red/8.png"],
      "9 Rojo" : ["rojo", "9", "assets/deck/original/red/9.png"],
      "x2 Rojo" : ["rojo", "20", "assets/deck/original/red/draw_2.png"],
      "Reverse Rojo" : ["rojo", "20", "assets/deck/original/red/reverse.png"],
      "Skip Rojo" : ["rojo", "20", "assets/deck/original/red/skip.png"],
    },

    "wild" : {
      "Wild" : ["wild", "50", "assets/deck/original/wild/wild.png"],
      "Wild x4" : ["wild", "50", "assets/deck/original/wild/wild_draw_4.png"],
    },
  },

  "Super Mario" : {
    "blue" : {
      "0 Azul" : ["azul", "0", "assets/deck/super_mario/blue/0.png"],
      "1 Azul" : ["azul", "1", "assets/deck/super_mario/blue/1.png"],
      "2 Azul" : ["azul", "2", "assets/deck/super_mario/blue/2.png"],
      "3 Azul" : ["azul", "3", "assets/deck/super_mario/blue/3.png"],
      "4 Azul" : ["azul", "4", "assets/deck/super_mario/blue/4.png"],
      "5 Azul" : ["azul", "5", "assets/deck/super_mario/blue/5.png"],
      "6 Azul" : ["azul", "6", "assets/deck/super_mario/blue/6.png"],
      "7 Azul" : ["azul", "7", "assets/deck/super_mario/blue/7.png"],
      "8 Azul" : ["azul", "8", "assets/deck/super_mario/blue/8.png"],
      "9 Azul" : ["azul", "9", "assets/deck/super_mario/blue/9.png"],
      "x2 Azul" : ["azul", "20", "assets/deck/super_mario/blue/draw_2.png"],
      "Reverse Azul" : ["azul", "20", "assets/deck/super_mario/blue/reverse.png"],
      "Skip Azul" : ["azul", "20", "assets/deck/super_mario/blue/skip.png"],
    },

    "green" : {
      "0 Verde" : ["verde", "0", "assets/deck/super_mario/green/0.png"],
      "1 Verde" : ["verde", "1", "assets/deck/super_mario/green/1.png"],
      "2 Verde" : ["verde", "2", "assets/deck/super_mario/green/2.png"],
      "3 Verde" : ["verde", "3", "assets/deck/super_mario/green/3.png"],
      "4 Verde" : ["verde", "4", "assets/deck/super_mario/green/4.png"],
      "5 Verde" : ["verde", "5", "assets/deck/super_mario/green/5.png"],
      "6 Verde" : ["verde", "6", "assets/deck/super_mario/green/6.png"],
      "7 Verde" : ["verde", "7", "assets/deck/super_mario/green/7.png"],
      "8 Verde" : ["verde", "8", "assets/deck/super_mario/green/8.png"],
      "9 Verde" : ["verde", "9", "assets/deck/super_mario/green/9.png"],
      "x2 Verde" : ["verde", "20", "assets/deck/super_mario/green/draw_2.png"],
      "Reverse Verde" : ["verde", "20", "assets/deck/super_mario/green/reverse.png"],
      "Skip Verde" : ["verde", "20", "assets/deck/super_mario/green/skip.png"],
    },

    "orange" : {
      "0 Naranja" : ["naranja", "0", "assets/deck/super_mario/orange/0.png"],
      "1 Naranja" : ["naranja", "1", "assets/deck/super_mario/orange/1.png"],
      "2 Naranja" : ["naranja", "2", "assets/deck/super_mario/orange/2.png"],
      "3 Naranja" : ["naranja", "3", "assets/deck/super_mario/orange/3.png"],
      "4 Naranja" : ["naranja", "4", "assets/deck/super_mario/orange/4.png"],
      "5 Naranja" : ["naranja", "5", "assets/deck/super_mario/orange/5.png"],
      "6 Naranja" : ["naranja", "6", "assets/deck/super_mario/orange/6.png"],
      "7 Naranja" : ["naranja", "7", "assets/deck/super_mario/orange/7.png"],
      "8 Naranja" : ["naranja", "8", "assets/deck/super_mario/orange/8.png"],
      "9 Naranja" : ["naranja", "9", "assets/deck/super_mario/orange/9.png"],
      "x2 Naranja" : ["naranja", "20", "assets/deck/super_mario/orange/draw_2.png"],
      "Reverse Naranja" : ["naranja", "20", "assets/deck/super_mario/orange/reverse.png"],
      "Skip Naranja" : ["naranja", "20", "assets/deck/super_mario/orange/skip.png"],
    },

    "red" : {
      "0 Rojo" : ["rojo", "0", "assets/deck/super_mario/red/0.png"],
      "1 Rojo" : ["rojo", "1", "assets/deck/super_mario/red/1.png"],
      "2 Rojo" : ["rojo", "2", "assets/deck/super_mario/red/2.png"],
      "3 Rojo" : ["rojo", "3", "assets/deck/super_mario/red/3.png"],
      "4 Rojo" : ["rojo", "4", "assets/deck/super_mario/red/4.png"],
      "5 Rojo" : ["rojo", "5", "assets/deck/super_mario/red/5.png"],
      "6 Rojo" : ["rojo", "6", "assets/deck/super_mario/red/6.png"],
      "7 Rojo" : ["rojo", "7", "assets/deck/super_mario/red/7.png"],
      "8 Rojo" : ["rojo", "8", "assets/deck/super_mario/red/8.png"],
      "9 Rojo" : ["rojo", "9", "assets/deck/super_mario/red/9.png"],
      "x2 Rojo" : ["rojo", "20", "assets/deck/super_mario/red/draw_2.png"],
      "Reverse Rojo" : ["rojo", "20", "assets/deck/super_mario/red/reverse.png"],
      "Skip Rojo" : ["rojo", "20", "assets/deck/super_mario/red/skip.png"],
    },

    "wild" : {
      "Wild" : ["wild", "50", "assets/deck/super_mario/wild/wild.png"],
      "Wild x4" : ["wild", "50", "assets/deck/super_mario/wild/wild_draw_4.png"],
    },
  },

    "Animal Crossing" : {
      "blue" : {
        "0 Azul" : ["azul", "0", "assets/deck/animal_crossing/blue/0.png"],
        "1 Azul" : ["azul", "1", "assets/deck/animal_crossing/blue/1.png"],
        "2 Azul" : ["azul", "2", "assets/deck/animal_crossing/blue/2.png"],
        "3 Azul" : ["azul", "3", "assets/deck/animal_crossing/blue/3.png"],
        "4 Azul" : ["azul", "4", "assets/deck/animal_crossing/blue/4.png"],
        "5 Azul" : ["azul", "5", "assets/deck/animal_crossing/blue/5.png"],
        "6 Azul" : ["azul", "6", "assets/deck/animal_crossing/blue/6.png"],
        "7 Azul" : ["azul", "7", "assets/deck/animal_crossing/blue/7.png"],
        "8 Azul" : ["azul", "8", "assets/deck/animal_crossing/blue/8.png"],
        "9 Azul" : ["azul", "9", "assets/deck/animal_crossing/blue/9.png"],
        "x2 Azul" : ["azul", "20", "assets/deck/animal_crossing/blue/draw_2.png"],
        "Reverse Azul" : ["azul", "20", "assets/deck/animal_crossing/blue/reverse.png"],
        "Skip Azul" : ["azul", "20", "assets/deck/animal_crossing/blue/skip.png"],
      },

      "green" : {
        "0 Verde" : ["verde", "0", "assets/deck/animal_crossing/green/0.png"],
        "1 Verde" : ["verde", "1", "assets/deck/animal_crossing/green/1.png"],
        "2 Verde" : ["verde", "2", "assets/deck/animal_crossing/green/2.png"],
        "3 Verde" : ["verde", "3", "assets/deck/animal_crossing/green/3.png"],
        "4 Verde" : ["verde", "4", "assets/deck/animal_crossing/green/4.png"],
        "5 Verde" : ["verde", "5", "assets/deck/animal_crossing/green/5.png"],
        "6 Verde" : ["verde", "6", "assets/deck/animal_crossing/green/6.png"],
        "7 Verde" : ["verde", "7", "assets/deck/animal_crossing/green/7.png"],
        "8 Verde" : ["verde", "8", "assets/deck/animal_crossing/green/8.png"],
        "9 Verde" : ["verde", "9", "assets/deck/animal_crossing/green/9.png"],
        "x2 Verde" : ["verde", "20", "assets/deck/animal_crossing/green/draw_2.png"],
        "Reverse Verde" : ["verde", "20", "assets/deck/animal_crossing/green/reverse.png"],
        "Skip Verde" : ["verde", "20", "assets/deck/animal_crossing/green/skip.png"],
      },

      "orange" : {
        "0 Naranja" : ["naranja", "0", "assets/deck/animal_crossing/orange/0.png"],
        "1 Naranja" : ["naranja", "1", "assets/deck/animal_crossing/orange/1.png"],
        "2 Naranja" : ["naranja", "2", "assets/deck/animal_crossing/orange/2.png"],
        "3 Naranja" : ["naranja", "3", "assets/deck/animal_crossing/orange/3.png"],
        "4 Naranja" : ["naranja", "4", "assets/deck/animal_crossing/orange/4.png"],
        "5 Naranja" : ["naranja", "5", "assets/deck/animal_crossing/orange/5.png"],
        "6 Naranja" : ["naranja", "6", "assets/deck/animal_crossing/orange/6.png"],
        "7 Naranja" : ["naranja", "7", "assets/deck/animal_crossing/orange/7.png"],
        "8 Naranja" : ["naranja", "8", "assets/deck/animal_crossing/orange/8.png"],
        "9 Naranja" : ["naranja", "9", "assets/deck/animal_crossing/orange/9.png"],
        "x2 Naranja" : ["naranja", "20", "assets/deck/animal_crossing/orange/draw_2.png"],
        "Reverse Naranja" : ["naranja", "20", "assets/deck/animal_crossing/orange/reverse.png"],
        "Skip Naranja" : ["naranja", "20", "assets/deck/animal_crossing/orange/skip.png"],
      },

      "red" : {
        "0 Rojo" : ["rojo", "0", "assets/deck/animal_crossing/red/0.png"],
        "1 Rojo" : ["rojo", "1", "assets/deck/animal_crossing/red/1.png"],
        "2 Rojo" : ["rojo", "2", "assets/deck/animal_crossing/red/2.png"],
        "3 Rojo" : ["rojo", "3", "assets/deck/animal_crossing/red/3.png"],
        "4 Rojo" : ["rojo", "4", "assets/deck/animal_crossing/red/4.png"],
        "5 Rojo" : ["rojo", "5", "assets/deck/animal_crossing/red/5.png"],
        "6 Rojo" : ["rojo", "6", "assets/deck/animal_crossing/red/6.png"],
        "7 Rojo" : ["rojo", "7", "assets/deck/animal_crossing/red/7.png"],
        "8 Rojo" : ["rojo", "8", "assets/deck/animal_crossing/red/8.png"],
        "9 Rojo" : ["rojo", "9", "assets/deck/animal_crossing/red/9.png"],
        "x2 Rojo" : ["rojo", "20", "assets/deck/animal_crossing/red/draw_2.png"],
        "Reverse Rojo" : ["rojo", "20", "assets/deck/animal_crossing/red/reverse.png"],
        "Skip Rojo" : ["rojo", "20", "assets/deck/animal_crossing/red/skip.png"],
      },

      "wild" : {
        "Wild" : ["wild", "50", "assets/deck/animal_crossing/wild/wild.png"],
        "Wild x4" : ["wild", "50", "assets/deck/animal_crossing/wild/wild_draw_4.png"],
      },
    }


  };

  static insertCards(){
    // This method creates a card for each value in Hash Map

    Cards.createTable(); // Create table

    for (String collection in cards.keys){
      for (String color in cards[collection].keys){
        for (String card in cards[collection][color].keys){
          Cards currentCard = Cards(
            name: card,
            color: cards[collection][color][card][0],
            value: cards[collection][color][card][1],
            uri: cards[collection][color][card][2],
            collection: collection
          );
          Cards.insertCardIntoTable(currentCard); // Insert cards
        }
      }
    }
  }
}