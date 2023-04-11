import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:uno_pocket/PlayersNameScreen/playersName_view.dart';
import '../../Screens/screens.dart';

class PlayersMenu extends StatelessWidget{
  PlayersMenu({
    required this.viewModel,
    required this.player,
});

  final AudioPlayer player;
  final PlayersModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.50 ,
      margin: EdgeInsets.only(top: height * 0.4, left: width * 0.1, right:  width * 0.1),
      child: Column(
        children: [
          // 1 Player Button
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child : InkWell(
              onTap: (){
                 player.pause();
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlayersNameView(isTwoPlayersMode: viewModel.isTwoPlayersMode = false, player: player,)));
              },
              child : Container(
              width: double.maxFinite,
              height: height * 0.2,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                children: [
                  SizedBox(width: width * 0.05,),
                  Image.asset("assets/players/player_1.png", width: width * 0.2, height: height * 0.2,),
                  SizedBox(width: width * 0.05,),
                  Text("1 Jugador", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(width: width * 0.1,),
                ],
              ),
              ),
            ),
          ),

            SizedBox(height: height * 0.02,),

          // 2 Players Button
          ClipRRect(
          borderRadius: BorderRadius.circular(30),
            child : InkWell(
              onTap: (){
                player.pause();
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlayersNameView(isTwoPlayersMode: viewModel.isTwoPlayersMode = true, player: player,)));
              },
              child : Container(
                width: double.maxFinite,
                height: height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    SizedBox(width: width * 0.05,),
                    Image.asset("assets/players/player_1.png", width: width * 0.2, height: height * 0.2,),
                    Image.asset("assets/players/player_2.png", width: width * 0.15, height: height * 0.2,),
                    SizedBox(width: width * 0.025,),
                    Text("2 Jugadores", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                    SizedBox(width: width * 0.025,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}