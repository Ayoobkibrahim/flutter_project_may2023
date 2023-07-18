import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UIGrid(),));
}
class UIGrid extends StatelessWidget {
  const UIGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 12,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
               crossAxisSpacing: 20,childAspectRatio: 4/2,
               mainAxisSpacing: 20,

          ), itemBuilder: (context ,index){
        return Card(
          color: Colors.blue,
          child: Center(
            child: Text(
              "Heart Shaker",style: const TextStyle(fontSize: 20,color: Colors.black),),


          ),
        );

        

      }),
    );
  }
}
