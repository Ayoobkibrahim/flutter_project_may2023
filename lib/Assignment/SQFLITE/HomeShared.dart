import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Assignment/SQFLITE/SharedPrefernces.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(const MaterialApp(
    home: HomeShared(),
    debugShowCheckedModeBanner: false,));
}

class HomeShared extends StatefulWidget {
  const HomeShared({super.key});

  @override
  State<HomeShared> createState() => _HomeSharedState();
}

class _HomeSharedState extends State<HomeShared> {
  late SharedPreferences preferences;
  late String username;

  @override
  void initState(){
    fetchdata();
    super.initState();
  }

  void fetchdata() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("USERNAME")!;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHARED HOME"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WELCOME $username",style:  TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: (){
              preferences.setBool("Newperson", true);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>ShPreference()));
            },
                child: Text("LOGOUT")),
          ],
        ),
      ),
    );
  }
}
