import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class ColorChangerNotification extends StatelessWidget{
  @override
  const ColorChangerNotification({
    required this.viewModel,
    super.key,
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.8,
      height: height * 0.15,
      margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top: height * 0.05),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // Color Square
          SizedBox(width: width * 0.05,),
          Container(
            width: width * 0.075,
            height: height * 0.05,
            margin: EdgeInsets.only(top: height * 0.05, bottom: height * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: viewModel.colorChanged,
            ),
          ),

          const Spacer(),
          // Message
          Text(viewModel.colorChangedStr, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          const Spacer(),
          IconButton(
              onPressed: (){
                viewModel.showColorChangerNotification = false;
                viewModel.notifyListeners();
              }
              , icon: const Icon(Icons.close_rounded, color: Colors.white, size: 25,)),
          SizedBox(width: width * 0.05,)
        ],
      ),
    );
  }
}

