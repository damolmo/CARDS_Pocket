import 'package:flutter/material.dart';
import 'package:uno_pocket/BoardScreen/board_model.dart';

class WildCardNotification extends StatelessWidget{
  @override
  const WildCardNotification({
    required this.viewModel,
    super.key,
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width  * 0.8,
      height: height * 0.15,
      margin: EdgeInsets.only(top: viewModel.showColorChangerNotification ? height * 0.22 :  height * 0.05, left: width * 0.1, right: width * 0.1),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // Current Wild Card
          SizedBox(width: width * 0.05,),
          Image.asset(viewModel.currentCard, width: width * 0.1, height: height * 0.1,),
          const Spacer(),

          // Message
          Text(viewModel.wildCardStr, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          const Spacer(),

          // Close Button
          IconButton(
            onPressed : (){
              // Close current notification
              viewModel.wildCardNotification = false;
              viewModel.notifyListeners();
            },
            icon: const Icon(Icons.close_rounded, color: Colors.white, size: 25,),

          ),
          SizedBox(width: width * 0.05,),
        ],
      ),
    );
  }
}