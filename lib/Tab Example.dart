
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
     debugShowCheckedModeBanner: false,
       home: Tab(),));
}

class Tab extends StatelessWidget{
  const Tab({super.key});
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
        title: Text("Whatsapp"),
        actions: [
          Icon(Icons.camera_alt),
          SizedBox(width: 30,),
          Icon(Icons.search),
          PopupMenuButton(itemBuilder: (context){
            return[
              const PopupMenuItem(child: Text("New Group")),
              const PopupMenuItem(child: Text("New Broadcast")),
              const PopupMenuItem(child: Text("Linked Devices")),
              const PopupMenuItem(child: Text("Starred messages")),
              const PopupMenuItem(child: Text("Payments")),
              const PopupMenuItem(child: Text("Settings")),


            ];
          }
          )
        ],
        bottom: const  TabBar(tabs: [
          Icon(Icons.people),
          Text("Chats"),
          Text("Status"),
          Text("Calls"),
        ]),
      ),
      body:TabBarView(children:  [
        Center(
          child:  Text("Community"),
        ),
        Center(child: ListView(
          children: const [
            ListTile(
                leading: CircleAvatar(backgroundImage: AssetImage("assets/images/Tanjiro.png")),
                title: Text("Tanjiro"),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all,color: Colors.blue,),
                    Text("Use Your Head, Not Just Spirit")
                  ],
                ),
                trailing: Text("12.00 Am")
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/Zenitsu.png")),
              title:  Text("zenitsu"),
              subtitle:  Row(
                children: [
                  Icon(Icons.done,),
                  Text("Women Have Rights")
                ],
              ),
              trailing: Text("6.10 pm"),
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/Inosuke.png")),
              title: Text("Inosuke"),
              subtitle:  Row(
                children: [
                  Icon(Icons.done_all,),
                  Text("What Was The Point")
                ],
              ),
              trailing: Text("Today") ,
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/Rengoku.png")),
              title:  Text("Rengoku"),
              subtitle:  Row(
                children: [
                  Icon(Icons.done_all),
                  Text("Set Your Heart Ablaze")
                ],
              ),
              trailing: Text("Yesterday"),
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/Akaza.png")),
              title: Text("Akaza"),
              subtitle:  Row(
                children: [

                  Text("Why don’t you become a demon")
                ],
              ),
              trailing: Text("15/05/2023"),
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/Tengen.png")),
              title: Text("Tengen"),
              subtitle:  Row(
                children: [
                  Icon(Icons.done_all,color: Colors.blue,),
                  Text("Listen Up. I Am A God")
                ],
              ),
              trailing:  Text("21/02/2023"),
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/Sanemi.png")),
              title: Text("Sanemi"),
              subtitle:  Row(
                children: [
                  Icon(Icons.done_all,),
                  Text("I'll Destroy you")
                ],
              ),
              trailing:  Text("07.00 Am"),
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/yorichi.png")),
              title: Text("Yorichi"),
              subtitle:  Row(
                children: [
                  Icon(Icons.done),
                  Text("What do you think life is ")
                ],
              ),
              trailing:  Text("05/06/2023"),
            ),

            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/Muichiro.png")),
              title: Text("Muichiro"),
              subtitle:  Row(
                children: [
                  Icon(Icons.done_all,color: Colors.blue,),
                  Text("Even if I lose my memories")
                ],
              ),
              trailing:  Text("Today"),
            ),

            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/images/Kokushibo.png")),
              title: Text("Kokushibo"),
              subtitle:  Row(
                children: [
                  Icon(Icons.done_all,color: Colors.blue,),
                  Text("Die before reach Age of 25")
                ],
              ),
              trailing:  Text("12/5/2023"),
            ),
          ],
        ),
        ),
        Center(
          child:  Text("Status"),
        ),
        Center(
          child:  Text("Calls"),
        ),
      ],

      ),
    ),
    );
  }
}