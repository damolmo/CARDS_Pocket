import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class ExplanationScreen extends StatelessWidget{
  @override
  const ExplanationScreen({
    required this.viewModel,
    super.key});

  final GuideModel viewModel;

  @override
  Widget build(BuildContext context){
    return  WillPopScope(onWillPop: () => viewModel.backToHome(),
        child : Stack(
          children: [
            // Background Theme
            BackgroundTheme(),

            // Dynamic Banner
            DynamicBanner(viewModel: viewModel,),

            // Dynamic grid
            DynamicCards(viewModel: viewModel),
          ],
        ),
    );
  }
}

class DynamicBanner extends StatelessWidget{
  @override
  const DynamicBanner({
    required this.viewModel,
    super.key});

  final GuideModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.3,
      margin: EdgeInsets.only(top: height * 0.05, left: width * 0.05, right: width * 0.05),
      child: Row(
        children: [
          // Left - Logo
          Container(
            width: width * 0.4,
            height: height * 0.3,
            child: Image.asset("assets/logo/logo.png", fit: BoxFit.fitWidth,),
          ),

          // Right - Title
          Container(
            width: width * 0.5,
            height: height * 0.3,
            child:Image.asset(viewModel.currentTitleUri, fit: BoxFit.fitWidth,) ,
          )
        ],
      ),
    );
  }
}

class DynamicCards extends StatelessWidget{
  @override
  DynamicCards({
    required this.viewModel,
    super.key});

  final GuideModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.45,
      margin: EdgeInsets.only(top: height * 0.35, bottom: height * 0.05, left: width * 0.02, right: width * 0.02),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemCount: viewModel.optionTitle[viewModel.choosedOption]["images"].length ,
          controller: ScrollController(initialScrollOffset: 2.0, keepScrollOffset: true) ,
          itemBuilder: (context, index){
            return Container(
              width: width * 0.4,
              height: height * 0.45,
              margin: EdgeInsets.only(right: width *0.03),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Stack(
                children: [
                  // Top - Image
                  Container(
                    width: width * 0.4,
                    height: height * 0.2,
                    margin: EdgeInsets.only(top: height * 0.05, bottom: height * 0.05, left: width * 0.3, right: width * 0.3 ),
                    child: Image.asset(viewModel.optionTitle[viewModel.choosedOption]["images"][index], fit: BoxFit.fitHeight,),
                  ),

                  // Bottom - Description
                  Container(
                    width: width * 0.8,
                    height: height * 0.15,
                    margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top:  height * 0.3),
                    child: Text(viewModel.optionTitle[viewModel.choosedOption]["strings"][index], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.left,),
                  )

                ],
              ),

            );
          },
      )
    );
  }
}
