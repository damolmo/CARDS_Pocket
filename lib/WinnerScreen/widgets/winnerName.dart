import 'package:flutter/material.dart';
import 'package:uno_pocket/Screens/screens.dart';

class WinnerName extends StatelessWidget{
  @override
  const WinnerName({
    required this.viewModel,
    super.key,
});

  final WinnerModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(top: height * 0.35, left: width * 0.1, right: width * 0.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(viewModel.winnerName, style:  TextStyle(color: Colors.white, fontSize: width * 0.10, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          const Spacer(),
        ],
      ),
    );
  }
}