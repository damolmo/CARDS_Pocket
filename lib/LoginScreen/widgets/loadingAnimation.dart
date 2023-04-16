import 'package:flutter/material.dart';

class LoadingAnimation extends StatelessWidget{
  @override
  const LoadingAnimation({super.key});
  
  @override
  Widget build(BuildContext context){
    
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    return Container(
      width: double.maxFinite,
      height: height * 0.65,
      margin: EdgeInsets.only(top: height * 0.25, bottom: height * 0.03, left: width * 0.05, right: width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        children: [

          SizedBox(height: height * 0.1,),
          
          // Title
          Container(
            width: double.maxFinite,
            height: height * 0.25,
            margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: Text("Iniciando Sesión", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: width * 0.1), textAlign: TextAlign.center,),
          ),

          const Spacer(),

          Container(
            margin: EdgeInsets.only(left: width * 0.2, right: width * 0.2),
            child: const CircularProgressIndicator(color: Colors.blueAccent,),
          ),

          const Spacer(),

          SizedBox(height: height * 0.1,)
          // Animation
        ],
      ),
    );
  }
}