import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Assignment/MusicApp/Music%20Ui.dart';
import 'package:flutter_project_may2023/Assignment/Splash%20Screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
void main(){
  runApp(MaterialApp(home: OnBoardingEx(),
  debugShowCheckedModeBanner: false,));
}

class OnBoardingEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = const PageDecoration(
        fullScreen: false,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 18, color: Colors.white),
        imagePadding: EdgeInsets.all(20),
        boxDecoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.pink,
              Colors.purple,
              Colors.tealAccent,
              Colors.cyanAccent
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)));

    return IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: pageDecoration,
          image: Align(
            // to place the widget at a desired position
            alignment: Alignment.topCenter,
            child: Image.asset("assets/images/JJK.jpg"),
          ),
          title: "First Page",
          body:
          "With Microsoft 365 for families, you can create, organize, and collaborate, all in one place",
        ),
        PageViewModel(
            decoration: const PageDecoration(
                fullScreen: true,
                titleTextStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(fontSize: 18, color: Colors.redAccent),
                imagePadding: EdgeInsets.all(20),
                boxDecoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/gradient.jpg")))),
            image: Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/Attack On Titan.jpg"),
            ),
            title: "SecondPage",
            body:
            "With Microsoft 365 for families, you can create, organize, and collaborate, all in one place"),
        PageViewModel(
            decoration: pageDecoration,
            image: Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/demon-slayer-season-3.webp"),
            ),
            title: "Third Page",
            body:
            "With Microsoft 365 for families, you can create, organize, and collaborate, all in one place")
      ],
      onDone: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MusicUi())),
      onSkip: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Splash())),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: Text("Next"),
      done: Text("continue"),
      dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Colors.black12,
          activeSize: Size(25, 10),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))
          )
      ),
    );
  }
}