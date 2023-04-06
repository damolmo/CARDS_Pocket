import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:uno_pocket/ClassificationScreen/classification_view.dart';
import 'package:uno_pocket/PlayersScreen/players_view.dart';

class OptionsMenu extends StatelessWidget{
  @override
  const OptionsMenu({
    required this.player,
    super.key
  });

  final AudioPlayer player;

  @override
  Widget build(BuildContext context){

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.maxFinite,
      height: height * 0.4,
      margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top: height * 0.4, bottom: height * 0.1),
      child: Column(
        children: [
          // Start Game Button
          SizedBox(
            width: width * 0.8,
            height: height * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: (){
                player.pause();
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlayersView(player: player,)));
              },
              child: const Text("Nueva Partida", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
            ),
          ),

          SizedBox(height: height * 0.015,),

          // Clasificacion
          SizedBox(
            width: width * 0.8,
            height: height * 0.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black
              ),
              onPressed: (){
                player.pause();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ClassificationView(player: player,)));
              },
              child: const Text("Clasificación", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30), textAlign: TextAlign.center,),
              ),
            ),
          ),

          SizedBox(height: height * 0.015,),

          // Instrucciones
          SizedBox(
            height: height * 0.1,
            width: width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child : TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black
                ),
                onPressed: (){
                  var snack = SnackBar(content: Text("Disponible próximamente", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, ), textAlign: TextAlign.center,),behavior: SnackBarBehavior.floating ,);
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                },
                child: const Text("Reglas", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
            ),
          )
        ],
      ),
    );
  }
}