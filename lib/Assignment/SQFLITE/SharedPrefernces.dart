
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Storage/SharedHome.dart';

void main(){
  runApp(const MaterialApp(
    home: ShPreference(),
    debugShowCheckedModeBanner: false,));
}

class ShPreference extends StatefulWidget {
  const ShPreference({super.key});

  @override
  State<ShPreference> createState() => _ShPreferenceState();
}

class _ShPreferenceState extends State<ShPreference> {

  final username_Controller= TextEditingController();
  final password_Controller= TextEditingController();

  late SharedPreferences preferences;// shared preference  instance

  late bool Newperson; // To  store value from shared preference

  @override
  void initState() {
    check_user_already_login();
    super.initState();
  }
  void check_user_already_login() async{
    preferences = await SharedPreferences.getInstance()!;

    Newperson = preferences.getBool("Newperson")?? true;

    if(Newperson == false){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SharedHome()));
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShPreference"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:const EdgeInsets.all(20.0),
              child: TextField(
                controller: username_Controller,
                decoration:const InputDecoration(
                    hintText: "USERNAME",
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.all(20.0),
              child: TextField(
                controller: password_Controller,
                decoration:const InputDecoration(
                    hintText: "PASSWORD",
                    border: OutlineInputBorder()
                ),
              ),
            ),

            ElevatedButton(onPressed: () async{
              preferences=await SharedPreferences.getInstance()!;
              String username=username_Controller.text;
              String password=password_Controller.text;

              if (username !="" && password!=""){
                preferences.setString("USERNAME",username);


                preferences.setBool("Newperson", false);

                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SharedHome()));
              }
            }, child: const Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}
