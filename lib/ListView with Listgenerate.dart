import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListView1(),));
}
class ListView1 extends StatelessWidget {
  var Names=[
    "Akaza",
    "Tanjiro",
    "Zenitsu",
    "Inosuke",
    "Rengoku"

  ];
  var Images=[
    "assets/images/Akaza.png",
    "assets/images/Tanjiro.png",
    "assets/images/Zenitsu.png",
    "assets/images/Inosuke.png",
    "assets/images/Rengoku.png",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView1"),
      ),
      body: ListView(
        children:
          List.generate(5, (index) =>  Card(
            color: Colors.blue,
            child: ListTile(
              leading: Image.asset(Images[index]),
              title: Text(Names[index]),
              subtitle: Text("Akaza"),
              trailing: Text("12.30"),
            ),
          ))
      ),
    );
  }
}
