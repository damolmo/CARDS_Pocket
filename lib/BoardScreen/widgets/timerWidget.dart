import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class TimerWidget extends StatelessWidget{
  const TimerWidget({
    required this.viewModel,
    super.key
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.1,
      margin: EdgeInsets.only(top: height * 0.07, left: width * 0.1, right:  width * 0.1),
      child: Text("${viewModel.currentWidgetTimer}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40), textAlign: TextAlign.center,),

    );
  }
}