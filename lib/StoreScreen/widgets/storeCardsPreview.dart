import 'package:flutter/material.dart';
import 'package:uno_pocket/Screens/screens.dart';

class StoreCardsPreview extends StatelessWidget{
  @override
  const StoreCardsPreview({
    required this.viewModel,
    super.key
});

  final StoreModel viewModel;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [

          // Background Theme
          BackgroundTheme(),

          // Banner
          PreviewBanner(viewModel: viewModel),

          // Cards Grid
          PreviewCards(viewModel: viewModel,),

          // Install Button
          InstallButton(viewModel: viewModel,),

        ],
      ),
    );
  }
}

class PreviewBanner extends StatelessWidget{
  @override
  const PreviewBanner({
    required this.viewModel,
    super.key});

  final StoreModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.15,
      margin: EdgeInsets.only(top: height * 0.07, right: width * 0.2, left: width * 0.2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        children: [
          const Spacer(),
          Text(viewModel.collections[viewModel.choosedCollectionIndex].name.replaceAll("_", " "), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
          const Spacer(),
        ],
      ),
    );
  }
}

class PreviewCards extends StatelessWidget{
  @override
  const PreviewCards({
    required this.viewModel,
    super.key});

  final StoreModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite ,
      height: height * 0.5,
      margin: EdgeInsets.only(top: height * 0.35, bottom: height * 0.05),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.collectionCards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
            crossAxisSpacing: 20,),
          itemBuilder: (context, index){
            return Container(
              width: width * 0.1,
              height: height * 0.5,
              margin: EdgeInsets.only(right: width * 0.02),
              child: Row(
                children: [
                    Image.asset(viewModel.collectionCards[index+index].uri),
                    Image.asset(viewModel.collectionCards[index+index+1].uri),
                ],
              )
            );
          },
       ),
    );
  }
}

class InstallButton extends StatelessWidget{
  @override
  const InstallButton({
    required this.viewModel,
    super.key});

  final StoreModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: height * 0.7,
      margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top: height * 0.85, bottom: height * 0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child : TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent,
          ),
          onPressed : (){
            viewModel.installTheme();
            var snack = SnackBar(content: Text("Se instaló el tema ${viewModel.choosedCollection}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),), behavior: SnackBarBehavior.floating ,);
            ScaffoldMessenger.of(context).showSnackBar(snack);
            viewModel.showPreview = false;
          },

          child: const Text("Instalar", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ),
      ),
    );
  }

}