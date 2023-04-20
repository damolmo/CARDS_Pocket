import 'package:flutter/material.dart';
import 'package:uno_pocket/Screens/screens.dart';

class StoreButton extends StatelessWidget{
  @override
  const StoreButton({
    required this.viewModel,
    super.key
});

  final TitleModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
          width: 70,
          height: 70,
          margin: EdgeInsets.only(top: height * 0.75, left: width * 0.75),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: InkWell(
            onTap : (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoreView(homePlayer: viewModel.player, userID: viewModel.userName) ));
            },
            child : Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(top: height * 0.01, bottom: height * 0.01, right: height * 0.01, left: height * 0.01 ),
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage("assets/store/bag.png"), fit: BoxFit.fill
                  )
              ),
          ),
        ),
    );
  }
}