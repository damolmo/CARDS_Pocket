import 'package:flutter/material.dart';
import '../../Screens/screens.dart';

class ClassificationsList extends StatelessWidget{
  ClassificationsList({
    required this.viewModel,
    super.key
});

  final ClassificationModel viewModel;


  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height:  height * 0.5,
      margin: EdgeInsets.only(top: height * 0.3, bottom: height * 0.1, right: width * 0.1, left: width * 0.1),
      child: ListView.builder(
          itemCount: viewModel.classifications.length,
          padding: EdgeInsets.only(),
          itemBuilder: (context, index){
            return InkWell(
              onTap : (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserView(user: viewModel.classifications[index], player: viewModel.player,) ));
              },
              child : Container(
                width:  double.maxFinite,
                height: height * 0.15,
                margin: EdgeInsets.only(bottom: height * 0.02),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo/logo.png"),
                    opacity: 0.2
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.5)
                 ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Name
                    SizedBox(width: width * 0.1,),
                    Text(viewModel.classifications[index].userName, style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text(viewModel.classifications[index].userVictories.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25), ),
                    SizedBox(width: width * 0.1,)
                  ],
                ),
          ),
            );
          },
      )
    );
  }
}