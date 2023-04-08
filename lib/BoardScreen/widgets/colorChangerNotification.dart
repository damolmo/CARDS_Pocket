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
      width: double.maxFinite,
      height: height * 0.15,
      margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05, top: height * 0.1),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // Color Square
          SizedBox(width: width * 0.05,),
          Container(
            width: width * 0.1,
            height: height * 0.05,
            margin: EdgeInsets.only(right: width * 0.05, top: height * 0.05, bottom: height * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: viewModel.colorChanged,
            ),
          ),

          // Message
          Text(viewModel.colorChangedStr, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          SizedBox(width: width * 0.02,),
          IconButton(
              onPressed: (){
                viewModel.showColorChangerNotification = false;
                viewModel.notifyListeners();
              }
              , icon: Icon(Icons.close_rounded, color: Colors.white, size: 25,)),
          SizedBox(width: width * 0.05,)
        ],
      ),
    );
  }
}

