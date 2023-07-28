import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Assignment/MusicApp/Images.dart';

import 'TitleWidget.dart';

void main(){
  runApp(MaterialApp(home: MusicPlayer(),
  debugShowCheckedModeBanner: false,));
}

class MusicPlayer extends StatefulWidget {


  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  int index =0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Musify",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget(title: "Suggested Playlist"),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    PlayListCard(),
                itemCount: 2
            ),
          ),
          TitleWidget(title: "Recommended for you"),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) =>
                  ListTile(

                leading: Image.asset("assets/images/dua lipa.jpg"),
                title: Text("Levitating",style: TextStyle(color: Colors.white),),
                subtitle: Text("Dua Lipa",style: TextStyle(color: Colors.white),),
                trailing:  const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star_border,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.download_outlined,
                      color: Colors.pinkAccent,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),

            ),
          ),



        ],
      ),

      bottomNavigationBar:BottomNavigationBar(
        selectedItemColor: Colors.pinkAccent,
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
          });
        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.pink,),label: "home",),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.pink,),label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.book,color: Colors.pink,),label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz,color: Colors.pink,),label: "library"),


        ],
        currentIndex: index,) ,

    );
  }
}

class PlayListCard extends StatelessWidget {
  final double height;
  final double width;
   PlayListCard({super.key,this.height=100,this.width=200});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage("assets/images/Car.jpg",),

              fit: BoxFit.fill
            )
      ),

    );

  }
}
