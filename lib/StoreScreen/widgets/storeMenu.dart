import 'package:flutter/material.dart';
import 'package:uno_pocket/Screens/screens.dart';

class StoreMenu extends StatelessWidget{
  StoreMenu({
    required this.viewModel,
});

  final StoreModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      margin: EdgeInsets.only(top: height * 0.4),
      child: ListView.builder(
        itemCount: viewModel.collections.length,
        itemBuilder: (context, index){
          return Container(
            width: width * 0.9,
            height: height * 0.2,
            margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05, bottom: height * 0.02),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(30)

            ),

            child: Row(
              children: [
                // Left - Thumbnail
                Container(
                  width: width * 0.3,
                  height: height * 0.2,
                  margin: EdgeInsets.only(left: width * 0.05, right: width * 0.07),
                  child: Image.asset(viewModel.collections[index].thumbnail, fit: BoxFit.fitWidth,),
                ),

                // Center - Collection Name
                Container(
                  width: width * 0.2,
                  height: height * 0.2,
                  margin: EdgeInsets.only(right: width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children  : [
                      const Spacer(),
                      Text(viewModel.collections[index].name.replaceAll("_", " "), style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      const Spacer(),
                    ]
                  ),
                ),

                // Right - IconButton
                Container(
                  width: width * 0.2,
                  height: height * 0.2,
                  margin: EdgeInsets.only(right: width * 0.05),
                  child: IconButton(
                    onPressed : (){
                      viewModel.readCollectionCards(index);
                      viewModel.showPreview = true;
                      viewModel.notifyListeners();
                    },
                    icon: Icon(Icons.navigate_next_rounded, color: Colors.black.withOpacity(0.3), size: 100,),
                  ),
                ),
              ],
             ),
           );
          },
      ),
    );
  }

}