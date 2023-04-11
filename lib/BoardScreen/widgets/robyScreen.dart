import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class RobyChoosedCardDialog extends StatelessWidget{
  @override
  const RobyChoosedCardDialog({
    required this.viewModel,
    super.key,
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.35,
      margin: EdgeInsets.only(top: height * 0.1),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Stack(
        children: [

          Container(
            width: width * 0.15,
            height: height * 0.12,
            margin: EdgeInsets.only(bottom: height * 0.05, top: height * 0.05, left: width * 0.4, right: width * 0.4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(width * 0.45),
              image: DecorationImage(
                image: AssetImage("assets/pet/roby.webp"),
                fit: BoxFit.fitHeight
               )
             ),
            ),

          Row(
            children: [
              // Left - Current Card
              SizedBox(width: width * 0.05,),
              if(viewModel.currentRobyCard.isNotEmpty)
              Container(
                width: width * 0.15,
                height: height * 0.1,
                margin: EdgeInsets.only(top: height * 0.2),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(width * 0.15),
                ),
                child: Image.asset(viewModel.currentRobyCard),
              ),
              const Spacer(),
              Container(
                width: double.maxFinite,
                height: height * 0.1,
                margin: EdgeInsets.only(top: height * 0.2, left: width * 0.02),
                child: Text(viewModel.currentRobyCardName.isNotEmpty ?  "Roby ha elegido la carta '${viewModel.currentRobyCardName}'" : "Roby ha pasado su turno", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: width * 0.05), maxLines: 2,),
              ),
              const Spacer(),
              SizedBox(width: width * 0.05,),
              ],
            ),

          ],
      )
    );
  }
}