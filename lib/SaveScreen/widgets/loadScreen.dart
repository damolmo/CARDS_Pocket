import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class LoadScreen extends StatelessWidget{
  @override
  LoadScreen({
    required this.viewModel,
});

  final SaveModel viewModel;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          BackgroundTheme(),

          // Title Dialog
          TitleDialog(),

          // BackupsList
          BackupsList(viewModel: viewModel),

        ],
      ),
    );
  }
}

class TitleDialog extends StatelessWidget{
  @override
  const TitleDialog({super.key});

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(top: height * 0.1, bottom: height * 0.1, left:  width * 0.1, right: width * 0.1),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/saveGame/loadGame.png"),
          fit: BoxFit.fitWidth
        )
      ),
    );
  }
}

class BackupsList extends StatelessWidget{
  @override
  const BackupsList({
    required this.viewModel,
    super.key
});

  final SaveModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.5,
      margin: EdgeInsets.only(top: height * 0.4, left:  width * 0.1, right: width * 0.1, bottom: height * 0.1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white.withOpacity(0.5),
      ),
      child: ListView.builder(
        itemCount: viewModel.saves.length,
        itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                backupPreview(context, viewModel, index);
              },
                child : Container(
                  width: width * 0.5,
                  height: height * 0.25,
                  margin: EdgeInsets.only(top: height * 0.05, left: width * 0.05, right: width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white.withOpacity(0.8)
                  ),
                  child: Row(
                    children: [
                      // Left Game Preview
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child : Image.asset("assets/logo/logo.png", width: width * 0.2, height: height * 0.2,),
                      ),
                      SizedBox(width: width * 0.05,),

                      // Right Game Name
                      Text(viewModel.saves[index].saveName, style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 3,),

                      SizedBox(width: width * 0.05,)
                    ],
                   ),
                ),
            );
          },
      )
    );
  }
}

backupPreview (BuildContext context, SaveModel viewModel, int index){
  return showDialog(
      context: context,
      builder: (BuildContext context){

        final height  = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;

        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.5),
          scrollable: true,
          content: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(30)
            ),
            margin: EdgeInsets.only(top: height * 0.05, bottom: height * 0.05, left: width * 0.05, right: width * 0.05),
            child: Column(
              children: [
                // Game Preview
                Container(
                  width: width * 0.3,
                  height: height * 0.2,
                  margin: EdgeInsets.only(bottom: height * 0.1, top: height * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage("assets/logo/logo.png"),
                      fit: BoxFit.fill
                    )
                  ),
                ),

                // Backup Name
                Container(
                  width: double.maxFinite,
                  height: height * 0.2,
                  margin: EdgeInsets.only(left:  width * 0.2, right: width * 0.2, bottom: height * 0.1),
                  child : Row(
                    children: [
                      Text(viewModel.saves[index].saveName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50),),
                    ],
                   ),
                ),

                // Load Button
                Container(
                  width: double.maxFinite,
                  height: height * 0.15,
                  margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1, bottom: height * 0.05 ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child : TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent
                    ),
                    onPressed :  (){
                      viewModel.player.pause();
                      viewModel.readUserChoosedSave(index, context);
                    },
                    child: Text("Cargar Partida", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                    ),
                  ),
                )
              ],
            ),
          )  ,
        );
      }
  );
}