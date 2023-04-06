import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class ColorChanger extends StatelessWidget{
  @override
  ColorChanger({
    required this.viewModel,
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Theme
          BackgroundTheme(),

          // Colors Title
          ColorsTitle(),

          // Colors Box
          ColorsBox(viewModel: viewModel,),
        ],
      ),
    );
  }
}

class ColorsTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1, bottom: height * 0.1),
      width: double.maxFinite,
      height: height * 0.2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/colorChanger/colorChanger.png"),
          fit: BoxFit.fitWidth
        )
      ),

    );
  }
}

class ColorsBox extends StatelessWidget{
  @override
  ColorsBox({
    required this.viewModel,
});

  final BoardModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.5,
      margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1,top: height * 0.3, bottom: height * 0.1),
      child: Column(
        children: [
          // First Row - Red and Blue
          Row(
            children: [
              // Red
              InkWell(
                onTap : (){
                  // TO-DO
                  print("Rojo");

                  viewModel.currentCardColor = "rojo";
                  viewModel.colorChanger = false;
                  viewModel.notifyListeners();

                 },
                child : Container(
                  width: width * 0.35,
                  height: height * 0.20,
                  margin: EdgeInsets.only(right: width * 0.1, bottom: height * 0.05),
                  decoration: BoxDecoration(
                    color:  Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30)
                    )
                  ),
                ),
              ),

              InkWell(
                onTap : (){
                  // TO-DO
                  print("Azul");

                  viewModel.currentCardColor = "azul";
                  viewModel.colorChanger = false;
                  viewModel.notifyListeners();
                },
                child : Container(
                  width: width * 0.35,
                  height: height * 0.20,
                  margin: EdgeInsets.only(bottom: height * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30)
                    )
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              // Second Row - Green and Orange
              InkWell(
                onTap: (){
                  // TO-DO
                  print("verde");

                  viewModel.currentCardColor = "verde";
                  viewModel.colorChanger = false;
                  viewModel.notifyListeners();
                },
                child : Container(
                  width: width * 0.35,
                  height: height * 0.20,
                  margin: EdgeInsets.only(right: width * 0.1),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30)
                    )
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                 print("Naranja");

                 viewModel.currentCardColor = "naranja";
                 viewModel.colorChanger = false;
                 viewModel.notifyListeners();

                 },
                child : Container(
                  width: width * 0.35,
                  height: height * 0.20,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30)
                      )
                  ),
                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}