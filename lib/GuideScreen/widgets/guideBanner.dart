import 'package:flutter/material.dart';

class GuideBanner extends StatelessWidget{
  @override
  const GuideBanner({super.key});

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.8,
      height: height * 0.3,
      margin: EdgeInsets.only(top: height * 0.05, left: width * 0.1, right: width * 0.1),
      child: Row(
        children: [
          //  Logo asset
          Container(
            width: width * 0.4,
            height: height * 0.3,
            margin: EdgeInsets.only(right: width * 0.05),
            child: Image.asset("assets/logo/logo.png"),
          ),

            Container(
              width: width * 0.3,
              height: height * 0.3 ,
              margin: EdgeInsets.only(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/guide/guide.png"),
                  fit: BoxFit.fitWidth
                )
              ),
            ),
        ],
      ),
    );
  }
}