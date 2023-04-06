import 'package:flutter/material.dart';
import 'package:uno_pocket/Screens/screens.dart';

class UserResume extends StatelessWidget{
  @override
  const UserResume({
    required this.viewModel,
    super.key});

  final UserModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        children: [
          // UNO logo
          UnoLogo(),

          // Current User Name Box
          UserNameBox(viewModel: viewModel,),

          // Current User Score Box
          UserDetails(viewModel: viewModel),
        ],
      ),

    );
  }
}

class UnoLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      width: double.maxFinite,
      height: height * 0.2,
      margin: EdgeInsets.only(
          top: height * 0.1, left: width * 0.1, right: width * 0.1, bottom: height * 0.05),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/logo/logo.png"),
              fit: BoxFit.fitHeight
          )
      ),
    );
  }
}

  class UserNameBox extends StatelessWidget{

    @override
    const UserNameBox({
     required this.viewModel,
  });

    final UserModel viewModel;

    @override
    Widget build(BuildContext context){
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;

      return Container(
        width: double.maxFinite,
        height: height * 0.15,
        margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1, bottom: height * 0.05),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(viewModel.userClassification.userName, style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),),
            const Spacer(),

          ],
        ),
      );
  }
}

class UserDetails extends StatelessWidget{
  @override
  UserDetails({
    required this.viewModel,
});

  final UserModel viewModel;

  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.4,
      margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          // Score
          Container(
            width: double.maxFinite,
            height:  height * 0.15,
            margin: EdgeInsets.only(bottom: height * 0.03),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                // Title
                Row(
                  children: [
                    const Spacer(),
                    Text("Puntuación", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
                    const Spacer(),
                  ],
                ),
                // Score
                Row(
                  children: [
                    const Spacer(),
                    Text(viewModel.userClassification.userPoints.toString(), style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),

          Row(
            children: [
              //  Victories box
              Container(
                width: width *  0.28,
                height: height * 0.17,
                margin: EdgeInsets.only(right: width * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    // Title
                    Row(
                      children: [
                        const Spacer(),
                        Text("Victorias", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
                        const Spacer(),
                      ],
                    ),

                    Row(
                      children: [
                        const Spacer(),
                        Text(viewModel.userClassification.userVictories.toString(), style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              Container(
                width: width * 0.28,
                height: height * 0.17,
                margin: EdgeInsets.only(right: width * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    // Title
                    Row(
                      children: const  [
                        Spacer(),
                        Text("Derrotas", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
                        Spacer(),
                      ],
                    ),

                    Row(
                      children: [
                        const Spacer(),
                        Text(viewModel.userClassification.userLosts.toString(), style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),

                  ],
                ),
              ),

              Container(
                width: width * 0.28,
                height: height * 0.17,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      children: const  [
                        // Title
                        Spacer(),
                        Text("Jugadas", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
                        Spacer(),
                      ],
                    ),

                    Row(
                      children: [
                        // Games
                        const Spacer(),
                        Text(viewModel.userClassification.userGames.toString(), style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}