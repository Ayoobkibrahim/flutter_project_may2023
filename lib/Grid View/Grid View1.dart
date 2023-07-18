import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridView1(),));
}
class GridView1 extends StatelessWidget {
  const GridView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
         gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
         crossAxisSpacing: 30,
         mainAxisSpacing: 10),
      children: List.generate(30, (index) => Card(child: Center(
        child: Image.asset("assets/images/Nezuko.jpg"),
      ),
      )
      ),
      ),
    );
  }
}
