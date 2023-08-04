import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Storage/Login%20Using%20Shared%20preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHome extends StatefulWidget {
  const SharedHome({super.key});

  @override
  State<SharedHome> createState() => _SharedHomeState();
}

class _SharedHomeState extends State<SharedHome> {

  late SharedPreferences preferences;
  late String Username;

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  // to read data from shared preference
  void fetchdata() async{
    preferences= await SharedPreferences.getInstance();
    setState(() {
      Username = preferences.getString("Username")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Home"),
      ),
      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Welcome $Username",style: TextStyle(fontSize: 30),),
           ElevatedButton(onPressed: (){
             preferences.setBool("NewUser", true);
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPageShared()));
           }, child: Text("Log Out")),



         ],
       ),
      ),
    );
  }
}
