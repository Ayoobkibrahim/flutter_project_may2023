
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.black),
    debugShowCheckedModeBanner: false,
    home: MusicPlayer(),));

}
class MusicPlayer extends StatefulWidget {
  @override
  State<MusicPlayer> createState() => _MusicUiState();
}

class _MusicUiState extends State<MusicPlayer> {
  List image=[
    "assets/images/demon-slayer-season-3.webp",
    "assets/images/Attack On Titan.jpg",

  ];
  int index=0;

  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            floating: true,
            pinned: true,

            title: Center(child: Text("Musify.",
              style: TextStyle(color: Colors.pinkAccent,fontSize: 27),)),
            bottom: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              title: Container(width: double.infinity,
                height: 50,
                child:  Text("Suggested playlists",style: TextStyle(color: Colors.pinkAccent),

                ),

              ),
            ),
          ),
          SliverGrid.builder( itemCount: image.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index){
                return Container(margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image[index]),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),

                );
              }

          ),

        ],

      ),


      bottomNavigationBar:BottomNavigationBar(
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
          });
        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: "home",),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.white,),label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.book,color: Colors.white,),label: "library"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz_rounded,color: Colors.white,),label: "library"),


        ],
        currentIndex: index,) ,

    );
  }
}
