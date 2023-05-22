import 'dart:io' as IO;
import 'package:platform/platform.dart';
import 'package:uno_pocket/DataBases/cards.dart';

class CardsData{

  static Map<String,dynamic> cards = {

  "CARDS_Pocket_Original" : {
    "blue" : {
      "0 Azul" : ["azul", "0", "assets/deck/CARDS_Pocket_Original/blue/0.png"],
      "1 Azul" : ["azul", "1", "assets/deck/CARDS_Pocket_Original/blue/1.png"],
      "2 Azul" : ["azul", "2", "assets/deck/CARDS_Pocket_Original/blue/2.png"],
      "3 Azul" : ["azul", "3", "assets/deck/CARDS_Pocket_Original/blue/3.png"],
      "4 Azul" : ["azul", "4", "assets/deck/CARDS_Pocket_Original/blue/4.png"],
      "5 Azul" : ["azul", "5", "assets/deck/CARDS_Pocket_Original/blue/5.png"],
      "6 Azul" : ["azul", "6", "assets/deck/CARDS_Pocket_Original/blue/6.png"],
      "7 Azul" : ["azul", "7", "assets/deck/CARDS_Pocket_Original/blue/7.png"],
      "8 Azul" : ["azul", "8", "assets/deck/CARDS_Pocket_Original/blue/8.png"],
      "9 Azul" : ["azul", "9", "assets/deck/CARDS_Pocket_Original/blue/9.png"],
      "x2 Azul" : ["azul", "20", "assets/deck/CARDS_Pocket_Original/blue/draw_2.png"],
      "Reverse Azul" : ["azul", "20", "assets/deck/CARDS_Pocket_Original/blue/reverse.png"],
      "Skip Azul" : ["azul", "20", "assets/deck/CARDS_Pocket_Original/blue/skip.png"],
    },

    "green" : {
      "0 Verde" : ["verde", "0", "assets/deck/CARDS_Pocket_Original/green/0.png"],
      "1 Verde" : ["verde", "1", "assets/deck/CARDS_Pocket_Original/green/1.png"],
      "2 Verde" : ["verde", "2", "assets/deck/CARDS_Pocket_Original/green/2.png"],
      "3 Verde" : ["verde", "3", "assets/deck/CARDS_Pocket_Original/green/3.png"],
      "4 Verde" : ["verde", "4", "assets/deck/CARDS_Pocket_Original/green/4.png"],
      "5 Verde" : ["verde", "5", "assets/deck/CARDS_Pocket_Original/green/5.png"],
      "6 Verde" : ["verde", "6", "assets/deck/CARDS_Pocket_Original/green/6.png"],
      "7 Verde" : ["verde", "7", "assets/deck/CARDS_Pocket_Original/green/7.png"],
      "8 Verde" : ["verde", "8", "assets/deck/CARDS_Pocket_Original/green/8.png"],
      "9 Verde" : ["verde", "9", "assets/deck/CARDS_Pocket_Original/green/9.png"],
      "x2 Verde" : ["verde", "20", "assets/deck/CARDS_Pocket_Original/green/draw_2.png"],
      "Reverse Verde" : ["verde", "20", "assets/deck/CARDS_Pocket_Original/green/reverse.png"],
      "Skip Verde" : ["verde", "20", "assets/deck/CARDS_Pocket_Original/green/skip.png"],
    },

    "orange" : {
      "0 Naranja" : ["naranja", "0", "assets/deck/CARDS_Pocket_Original/orange/0.png"],
      "1 Naranja" : ["naranja", "1", "assets/deck/CARDS_Pocket_Original/orange/1.png"],
      "2 Naranja" : ["naranja", "2", "assets/deck/CARDS_Pocket_Original/orange/2.png"],
      "3 Naranja" : ["naranja", "3", "assets/deck/CARDS_Pocket_Original/orange/3.png"],
      "4 Naranja" : ["naranja", "4", "assets/deck/CARDS_Pocket_Original/orange/4.png"],
      "5 Naranja" : ["naranja", "5", "assets/deck/CARDS_Pocket_Original/orange/5.png"],
      "6 Naranja" : ["naranja", "6", "assets/deck/CARDS_Pocket_Original/orange/6.png"],
      "7 Naranja" : ["naranja", "7", "assets/deck/CARDS_Pocket_Original/orange/7.png"],
      "8 Naranja" : ["naranja", "8", "assets/deck/CARDS_Pocket_Original/orange/8.png"],
      "9 Naranja" : ["naranja", "9", "assets/deck/CARDS_Pocket_Original/orange/9.png"],
      "x2 Naranja" : ["naranja", "20", "assets/deck/CARDS_Pocket_Original/orange/draw_2.png"],
      "Reverse Naranja" : ["naranja", "20", "assets/deck/CARDS_Pocket_Original/orange/reverse.png"],
      "Skip Naranja" : ["naranja", "20", "assets/deck/CARDS_Pocket_Original/orange/skip.png"],
    },

    "red" : {
      "0 Rojo" : ["rojo", "0", "assets/deck/CARDS_Pocket_Original/red/0.png"],
      "1 Rojo" : ["rojo", "1", "assets/deck/CARDS_Pocket_Original/red/1.png"],
      "2 Rojo" : ["rojo", "2", "assets/deck/CARDS_Pocket_Original/red/2.png"],
      "3 Rojo" : ["rojo", "3", "assets/deck/CARDS_Pocket_Original/red/3.png"],
      "4 Rojo" : ["rojo", "4", "assets/deck/CARDS_Pocket_Original/red/4.png"],
      "5 Rojo" : ["rojo", "5", "assets/deck/CARDS_Pocket_Original/red/5.png"],
      "6 Rojo" : ["rojo", "6", "assets/deck/CARDS_Pocket_Original/red/6.png"],
      "7 Rojo" : ["rojo", "7", "assets/deck/CARDS_Pocket_Original/red/7.png"],
      "8 Rojo" : ["rojo", "8", "assets/deck/CARDS_Pocket_Original/red/8.png"],
      "9 Rojo" : ["rojo", "9", "assets/deck/CARDS_Pocket_Original/red/9.png"],
      "x2 Rojo" : ["rojo", "20", "assets/deck/CARDS_Pocket_Original/red/draw_2.png"],
      "Reverse Rojo" : ["rojo", "20", "assets/deck/CARDS_Pocket_Original/red/reverse.png"],
      "Skip Rojo" : ["rojo", "20", "assets/deck/CARDS_Pocket_Original/red/skip.png"],
    },

    "wild" : {
      "Wild" : ["wild", "50", "assets/deck/CARDS_Pocket_Original/wild/wild.png"],
      "Wild x4" : ["wild", "50", "assets/deck/CARDS_Pocket_Original/wild/wild_draw_4.png"],
    },
  },

  "Super_Mario" : {
    "blue" : {
      "0 Azul" : ["azul", "0", "assets/deck/Super_Mario/blue/0.png"],
      "1 Azul" : ["azul", "1", "assets/deck/Super_Mario/blue/1.png"],
      "2 Azul" : ["azul", "2", "assets/deck/Super_Mario/blue/2.png"],
      "3 Azul" : ["azul", "3", "assets/deck/Super_Mario/blue/3.png"],
      "4 Azul" : ["azul", "4", "assets/deck/Super_Mario/blue/4.png"],
      "5 Azul" : ["azul", "5", "assets/deck/Super_Mario/blue/5.png"],
      "6 Azul" : ["azul", "6", "assets/deck/Super_Mario/blue/6.png"],
      "7 Azul" : ["azul", "7", "assets/deck/Super_Mario/blue/7.png"],
      "8 Azul" : ["azul", "8", "assets/deck/Super_Mario/blue/8.png"],
      "9 Azul" : ["azul", "9", "assets/deck/Super_Mario/blue/9.png"],
      "x2 Azul" : ["azul", "20", "assets/deck/Super_Mario/blue/draw_2.png"],
      "Reverse Azul" : ["azul", "20", "assets/deck/Super_Mario/blue/reverse.png"],
      "Skip Azul" : ["azul", "20", "assets/deck/Super_Mario/blue/skip.png"],
    },

    "green" : {
      "0 Verde" : ["verde", "0", "assets/deck/Super_Mario/green/0.png"],
      "1 Verde" : ["verde", "1", "assets/deck/Super_Mario/green/1.png"],
      "2 Verde" : ["verde", "2", "assets/deck/Super_Mario/green/2.png"],
      "3 Verde" : ["verde", "3", "assets/deck/Super_Mario/green/3.png"],
      "4 Verde" : ["verde", "4", "assets/deck/Super_Mario/green/4.png"],
      "5 Verde" : ["verde", "5", "assets/deck/Super_Mario/green/5.png"],
      "6 Verde" : ["verde", "6", "assets/deck/Super_Mario/green/6.png"],
      "7 Verde" : ["verde", "7", "assets/deck/Super_Mario/green/7.png"],
      "8 Verde" : ["verde", "8", "assets/deck/Super_Mario/green/8.png"],
      "9 Verde" : ["verde", "9", "assets/deck/Super_Mario/green/9.png"],
      "x2 Verde" : ["verde", "20", "assets/deck/Super_Mario/green/draw_2.png"],
      "Reverse Verde" : ["verde", "20", "assets/deck/Super_Mario/green/reverse.png"],
      "Skip Verde" : ["verde", "20", "assets/deck/Super_Mario/green/skip.png"],
    },

    "orange" : {
      "0 Naranja" : ["naranja", "0", "assets/deck/Super_Mario/orange/0.png"],
      "1 Naranja" : ["naranja", "1", "assets/deck/Super_Mario/orange/1.png"],
      "2 Naranja" : ["naranja", "2", "assets/deck/Super_Mario/orange/2.png"],
      "3 Naranja" : ["naranja", "3", "assets/deck/Super_Mario/orange/3.png"],
      "4 Naranja" : ["naranja", "4", "assets/deck/Super_Mario/orange/4.png"],
      "5 Naranja" : ["naranja", "5", "assets/deck/Super_Mario/orange/5.png"],
      "6 Naranja" : ["naranja", "6", "assets/deck/Super_Mario/orange/6.png"],
      "7 Naranja" : ["naranja", "7", "assets/deck/Super_Mario/orange/7.png"],
      "8 Naranja" : ["naranja", "8", "assets/deck/Super_Mario/orange/8.png"],
      "9 Naranja" : ["naranja", "9", "assets/deck/Super_Mario/orange/9.png"],
      "x2 Naranja" : ["naranja", "20", "assets/deck/Super_Mario/orange/draw_2.png"],
      "Reverse Naranja" : ["naranja", "20", "assets/deck/Super_Mario/orange/reverse.png"],
      "Skip Naranja" : ["naranja", "20", "assets/deck/Super_Mario/orange/skip.png"],
    },

    "red" : {
      "0 Rojo" : ["rojo", "0", "assets/deck/Super_Mario/red/0.png"],
      "1 Rojo" : ["rojo", "1", "assets/deck/Super_Mario/red/1.png"],
      "2 Rojo" : ["rojo", "2", "assets/deck/Super_Mario/red/2.png"],
      "3 Rojo" : ["rojo", "3", "assets/deck/Super_Mario/red/3.png"],
      "4 Rojo" : ["rojo", "4", "assets/deck/Super_Mario/red/4.png"],
      "5 Rojo" : ["rojo", "5", "assets/deck/Super_Mario/red/5.png"],
      "6 Rojo" : ["rojo", "6", "assets/deck/Super_Mario/red/6.png"],
      "7 Rojo" : ["rojo", "7", "assets/deck/Super_Mario/red/7.png"],
      "8 Rojo" : ["rojo", "8", "assets/deck/Super_Mario/red/8.png"],
      "9 Rojo" : ["rojo", "9", "assets/deck/Super_Mario/red/9.png"],
      "x2 Rojo" : ["rojo", "20", "assets/deck/Super_Mario/red/draw_2.png"],
      "Reverse Rojo" : ["rojo", "20", "assets/deck/Super_Mario/red/reverse.png"],
      "Skip Rojo" : ["rojo", "20", "assets/deck/Super_Mario/red/skip.png"],
    },

    "wild" : {
      "Wild" : ["wild", "50", "assets/deck/Super_Mario/wild/wild.png"],
      "Wild x4" : ["wild", "50", "assets/deck/Super_Mario/wild/wild_draw_4.png"],
    },
  },

    "Animal_Crossing" : {
      "blue" : {
        "0 Azul" : ["azul", "0", "assets/deck/Animal_Crossing/blue/0.png"],
        "1 Azul" : ["azul", "1", "assets/deck/Animal_Crossing/blue/1.png"],
        "2 Azul" : ["azul", "2", "assets/deck/Animal_Crossing/blue/2.png"],
        "3 Azul" : ["azul", "3", "assets/deck/Animal_Crossing/blue/3.png"],
        "4 Azul" : ["azul", "4", "assets/deck/Animal_Crossing/blue/4.png"],
        "5 Azul" : ["azul", "5", "assets/deck/Animal_Crossing/blue/5.png"],
        "6 Azul" : ["azul", "6", "assets/deck/Animal_Crossing/blue/6.png"],
        "7 Azul" : ["azul", "7", "assets/deck/Animal_Crossing/blue/7.png"],
        "8 Azul" : ["azul", "8", "assets/deck/Animal_Crossing/blue/8.png"],
        "9 Azul" : ["azul", "9", "assets/deck/Animal_Crossing/blue/9.png"],
        "x2 Azul" : ["azul", "20", "assets/deck/Animal_Crossing/blue/draw_2.png"],
        "Reverse Azul" : ["azul", "20", "assets/deck/Animal_Crossing/blue/reverse.png"],
        "Skip Azul" : ["azul", "20", "assets/deck/Animal_Crossing/blue/skip.png"],
      },

      "green" : {
        "0 Verde" : ["verde", "0", "assets/deck/Animal_Crossing/green/0.png"],
        "1 Verde" : ["verde", "1", "assets/deck/Animal_Crossing/green/1.png"],
        "2 Verde" : ["verde", "2", "assets/deck/Animal_Crossing/green/2.png"],
        "3 Verde" : ["verde", "3", "assets/deck/Animal_Crossing/green/3.png"],
        "4 Verde" : ["verde", "4", "assets/deck/Animal_Crossing/green/4.png"],
        "5 Verde" : ["verde", "5", "assets/deck/Animal_Crossing/green/5.png"],
        "6 Verde" : ["verde", "6", "assets/deck/Animal_Crossing/green/6.png"],
        "7 Verde" : ["verde", "7", "assets/deck/Animal_Crossing/green/7.png"],
        "8 Verde" : ["verde", "8", "assets/deck/Animal_Crossing/green/8.png"],
        "9 Verde" : ["verde", "9", "assets/deck/Animal_Crossing/green/9.png"],
        "x2 Verde" : ["verde", "20", "assets/deck/Animal_Crossing/green/draw_2.png"],
        "Reverse Verde" : ["verde", "20", "assets/deck/Animal_Crossing/green/reverse.png"],
        "Skip Verde" : ["verde", "20", "assets/deck/Animal_Crossing/green/skip.png"],
      },

      "orange" : {
        "0 Naranja" : ["naranja", "0", "assets/deck/Animal_Crossing/orange/0.png"],
        "1 Naranja" : ["naranja", "1", "assets/deck/Animal_Crossing/orange/1.png"],
        "2 Naranja" : ["naranja", "2", "assets/deck/Animal_Crossing/orange/2.png"],
        "3 Naranja" : ["naranja", "3", "assets/deck/Animal_Crossing/orange/3.png"],
        "4 Naranja" : ["naranja", "4", "assets/deck/Animal_Crossing/orange/4.png"],
        "5 Naranja" : ["naranja", "5", "assets/deck/Animal_Crossing/orange/5.png"],
        "6 Naranja" : ["naranja", "6", "assets/deck/Animal_Crossing/orange/6.png"],
        "7 Naranja" : ["naranja", "7", "assets/deck/Animal_Crossing/orange/7.png"],
        "8 Naranja" : ["naranja", "8", "assets/deck/Animal_Crossing/orange/8.png"],
        "9 Naranja" : ["naranja", "9", "assets/deck/Animal_Crossing/orange/9.png"],
        "x2 Naranja" : ["naranja", "20", "assets/deck/Animal_Crossing/orange/draw_2.png"],
        "Reverse Naranja" : ["naranja", "20", "assets/deck/Animal_Crossing/orange/reverse.png"],
        "Skip Naranja" : ["naranja", "20", "assets/deck/Animal_Crossing/orange/skip.png"],
      },

      "red" : {
        "0 Rojo" : ["rojo", "0", "assets/deck/Animal_Crossing/red/0.png"],
        "1 Rojo" : ["rojo", "1", "assets/deck/Animal_Crossing/red/1.png"],
        "2 Rojo" : ["rojo", "2", "assets/deck/Animal_Crossing/red/2.png"],
        "3 Rojo" : ["rojo", "3", "assets/deck/Animal_Crossing/red/3.png"],
        "4 Rojo" : ["rojo", "4", "assets/deck/Animal_Crossing/red/4.png"],
        "5 Rojo" : ["rojo", "5", "assets/deck/Animal_Crossing/red/5.png"],
        "6 Rojo" : ["rojo", "6", "assets/deck/Animal_Crossing/red/6.png"],
        "7 Rojo" : ["rojo", "7", "assets/deck/Animal_Crossing/red/7.png"],
        "8 Rojo" : ["rojo", "8", "assets/deck/Animal_Crossing/red/8.png"],
        "9 Rojo" : ["rojo", "9", "assets/deck/Animal_Crossing/red/9.png"],
        "x2 Rojo" : ["rojo", "20", "assets/deck/Animal_Crossing/red/draw_2.png"],
        "Reverse Rojo" : ["rojo", "20", "assets/deck/Animal_Crossing/red/reverse.png"],
        "Skip Rojo" : ["rojo", "20", "assets/deck/Animal_Crossing/red/skip.png"],
      },

      "wild" : {
        "Wild" : ["wild", "50", "assets/deck/Animal_Crossing/wild/wild.png"],
        "Wild x4" : ["wild", "50", "assets/deck/Animal_Crossing/wild/wild_draw_4.png"],
      },
    },

    "Pokemon" : {
      "blue" : {
        "0 Azul" : ["azul", "0", "assets/deck/Pokemon/blue/0.png"],
        "1 Azul" : ["azul", "1", "assets/deck/Pokemon/blue/1.png"],
        "2 Azul" : ["azul", "2", "assets/deck/Pokemon/blue/2.png"],
        "3 Azul" : ["azul", "3", "assets/deck/Pokemon/blue/3.png"],
        "4 Azul" : ["azul", "4", "assets/deck/Pokemon/blue/4.png"],
        "5 Azul" : ["azul", "5", "assets/deck/Pokemon/blue/5.png"],
        "6 Azul" : ["azul", "6", "assets/deck/Pokemon/blue/6.png"],
        "7 Azul" : ["azul", "7", "assets/deck/Pokemon/blue/7.png"],
        "8 Azul" : ["azul", "8", "assets/deck/Pokemon/blue/8.png"],
        "9 Azul" : ["azul", "9", "assets/deck/Pokemon/blue/9.png"],
        "x2 Azul" : ["azul", "20", "assets/deck/Pokemon/blue/draw_2.png"],
        "Reverse Azul" : ["azul", "20", "assets/deck/Pokemon/blue/reverse.png"],
        "Skip Azul" : ["azul", "20", "assets/deck/Pokemon/blue/skip.png"],
      },

      "green" : {
        "0 Verde" : ["verde", "0", "assets/deck/Pokemon/green/0.png"],
        "1 Verde" : ["verde", "1", "assets/deck/Pokemon/green/1.png"],
        "2 Verde" : ["verde", "2", "assets/deck/Pokemon/green/2.png"],
        "3 Verde" : ["verde", "3", "assets/deck/Pokemon/green/3.png"],
        "4 Verde" : ["verde", "4", "assets/deck/Pokemon/green/4.png"],
        "5 Verde" : ["verde", "5", "assets/deck/Pokemon/green/5.png"],
        "6 Verde" : ["verde", "6", "assets/deck/Pokemon/green/6.png"],
        "7 Verde" : ["verde", "7", "assets/deck/Pokemon/green/7.png"],
        "8 Verde" : ["verde", "8", "assets/deck/Pokemon/green/8.png"],
        "9 Verde" : ["verde", "9", "assets/deck/Pokemon/green/9.png"],
        "x2 Verde" : ["verde", "20", "assets/deck/Pokemon/green/draw_2.png"],
        "Reverse Verde" : ["verde", "20", "assets/deck/Pokemon/green/reverse.png"],
        "Skip Verde" : ["verde", "20", "assets/deck/Pokemon/green/skip.png"],
      },

      "orange" : {
        "0 Naranja" : ["naranja", "0", "assets/deck/Pokemon/orange/0.png"],
        "1 Naranja" : ["naranja", "1", "assets/deck/Pokemon/orange/1.png"],
        "2 Naranja" : ["naranja", "2", "assets/deck/Pokemon/orange/2.png"],
        "3 Naranja" : ["naranja", "3", "assets/deck/Pokemon/orange/3.png"],
        "4 Naranja" : ["naranja", "4", "assets/deck/Pokemon/orange/4.png"],
        "5 Naranja" : ["naranja", "5", "assets/deck/Pokemon/orange/5.png"],
        "6 Naranja" : ["naranja", "6", "assets/deck/Pokemon/orange/6.png"],
        "7 Naranja" : ["naranja", "7", "assets/deck/Pokemon/orange/7.png"],
        "8 Naranja" : ["naranja", "8", "assets/deck/Pokemon/orange/8.png"],
        "9 Naranja" : ["naranja", "9", "assets/deck/Pokemon/orange/9.png"],
        "x2 Naranja" : ["naranja", "20", "assets/deck/Pokemon/orange/draw_2.png"],
        "Reverse Naranja" : ["naranja", "20", "assets/deck/Pokemon/orange/reverse.png"],
        "Skip Naranja" : ["naranja", "20", "assets/deck/Pokemon/orange/skip.png"],
      },

      "red" : {
        "0 Rojo" : ["rojo", "0", "assets/deck/Pokemon/red/0.png"],
        "1 Rojo" : ["rojo", "1", "assets/deck/Pokemon/red/1.png"],
        "2 Rojo" : ["rojo", "2", "assets/deck/Pokemon/red/2.png"],
        "3 Rojo" : ["rojo", "3", "assets/deck/Pokemon/red/3.png"],
        "4 Rojo" : ["rojo", "4", "assets/deck/Pokemon/red/4.png"],
        "5 Rojo" : ["rojo", "5", "assets/deck/Pokemon/red/5.png"],
        "6 Rojo" : ["rojo", "6", "assets/deck/Pokemon/red/6.png"],
        "7 Rojo" : ["rojo", "7", "assets/deck/Pokemon/red/7.png"],
        "8 Rojo" : ["rojo", "8", "assets/deck/Pokemon/red/8.png"],
        "9 Rojo" : ["rojo", "9", "assets/deck/Pokemon/red/9.png"],
        "x2 Rojo" : ["rojo", "20", "assets/deck/Pokemon/red/draw_2.png"],
        "Reverse Rojo" : ["rojo", "20", "assets/deck/Pokemon/red/reverse.png"],
        "Skip Rojo" : ["rojo", "20", "assets/deck/Pokemon/red/skip.png"],
      },

      "wild" : {
        "Wild" : ["wild", "50", "assets/deck/Pokemon/wild/wild.png"],
        "Wild x4" : ["wild", "50", "assets/deck/Pokemon/wild/wild_draw_4.png"],
      },
    },

    "The Legend of Zelda" : {
      "blue" : {
        "0 Azul" : ["azul", "0", "assets/deck/Zelda/blue/0.png"],
        "1 Azul" : ["azul", "1", "assets/deck/Zelda/blue/1.png"],
        "2 Azul" : ["azul", "2", "assets/deck/Zelda/blue/2.png"],
        "3 Azul" : ["azul", "3", "assets/deck/Zelda/blue/3.png"],
        "4 Azul" : ["azul", "4", "assets/deck/Zelda/blue/4.png"],
        "5 Azul" : ["azul", "5", "assets/deck/Zelda/blue/5.png"],
        "6 Azul" : ["azul", "6", "assets/deck/Zelda/blue/6.png"],
        "7 Azul" : ["azul", "7", "assets/deck/Zelda/blue/7.png"],
        "8 Azul" : ["azul", "8", "assets/deck/Zelda/blue/8.png"],
        "9 Azul" : ["azul", "9", "assets/deck/Zelda/blue/9.png"],
        "x2 Azul" : ["azul", "20", "assets/deck/Zelda/blue/draw_2.png"],
        "Reverse Azul" : ["azul", "20", "assets/deck/Zelda/blue/reverse.png"],
        "Skip Azul" : ["azul", "20", "assets/deck/Zelda/blue/skip.png"],
      },

      "green" : {
        "0 Verde" : ["verde", "0", "assets/deck/Zelda/green/0.png"],
        "1 Verde" : ["verde", "1", "assets/deck/Zelda/green/1.png"],
        "2 Verde" : ["verde", "2", "assets/deck/Zelda/green/2.png"],
        "3 Verde" : ["verde", "3", "assets/deck/Zelda/green/3.png"],
        "4 Verde" : ["verde", "4", "assets/deck/Zelda/green/4.png"],
        "5 Verde" : ["verde", "5", "assets/deck/Zelda/green/5.png"],
        "6 Verde" : ["verde", "6", "assets/deck/Zelda/green/6.png"],
        "7 Verde" : ["verde", "7", "assets/deck/Zelda/green/7.png"],
        "8 Verde" : ["verde", "8", "assets/deck/Zelda/green/8.png"],
        "9 Verde" : ["verde", "9", "assets/deck/Zelda/green/9.png"],
        "x2 Verde" : ["verde", "20", "assets/deck/Zelda/green/draw_2.png"],
        "Reverse Verde" : ["verde", "20", "assets/deck/Zelda/green/reverse.png"],
        "Skip Verde" : ["verde", "20", "assets/deck/Zelda/green/skip.png"],
      },

      "orange" : {
        "0 Naranja" : ["naranja", "0", "assets/deck/Zelda/orange/0.png"],
        "1 Naranja" : ["naranja", "1", "assets/deck/Zelda/orange/1.png"],
        "2 Naranja" : ["naranja", "2", "assets/deck/Zelda/orange/2.png"],
        "3 Naranja" : ["naranja", "3", "assets/deck/Zelda/orange/3.png"],
        "4 Naranja" : ["naranja", "4", "assets/deck/Zelda/orange/4.png"],
        "5 Naranja" : ["naranja", "5", "assets/deck/Zelda/orange/5.png"],
        "6 Naranja" : ["naranja", "6", "assets/deck/Zelda/orange/6.png"],
        "7 Naranja" : ["naranja", "7", "assets/deck/Zelda/orange/7.png"],
        "8 Naranja" : ["naranja", "8", "assets/deck/Zelda/orange/8.png"],
        "9 Naranja" : ["naranja", "9", "assets/deck/Zelda/orange/9.png"],
        "x2 Naranja" : ["naranja", "20", "assets/deck/Zelda/orange/draw_2.png"],
        "Reverse Naranja" : ["naranja", "20", "assets/deck/Zelda/orange/reverse.png"],
        "Skip Naranja" : ["naranja", "20", "assets/deck/Zelda/orange/skip.png"],
      },

      "red" : {
        "0 Rojo" : ["rojo", "0", "assets/deck/Zelda/red/0.png"],
        "1 Rojo" : ["rojo", "1", "assets/deck/Zelda/red/1.png"],
        "2 Rojo" : ["rojo", "2", "assets/deck/Zelda/red/2.png"],
        "3 Rojo" : ["rojo", "3", "assets/deck/Zelda/red/3.png"],
        "4 Rojo" : ["rojo", "4", "assets/deck/Zelda/red/4.png"],
        "5 Rojo" : ["rojo", "5", "assets/deck/Zelda/red/5.png"],
        "6 Rojo" : ["rojo", "6", "assets/deck/Zelda/red/6.png"],
        "7 Rojo" : ["rojo", "7", "assets/deck/Zelda/red/7.png"],
        "8 Rojo" : ["rojo", "8", "assets/deck/Zelda/red/8.png"],
        "9 Rojo" : ["rojo", "9", "assets/deck/Zelda/red/9.png"],
        "x2 Rojo" : ["rojo", "20", "assets/deck/Zelda/red/draw_2.png"],
        "Reverse Rojo" : ["rojo", "20", "assets/deck/Zelda/red/reverse.png"],
        "Skip Rojo" : ["rojo", "20", "assets/deck/Zelda/red/skip.png"],
      },

      "wild" : {
        "Wild" : ["wild", "50", "assets/deck/Zelda/wild/wild.png"],
        "Wild x4" : ["wild", "50", "assets/deck/Zelda/wild/wild_draw_4.png"],
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