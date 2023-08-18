import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Assignment/SQFLITE/HomeShared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SharedRegistration.dart';

void main(){
  runApp(const MaterialApp(
    home: LoginShared(),
    debugShowCheckedModeBanner: false,));
}

class LoginShared extends StatefulWidget {
  const LoginShared({super.key});

  @override
  State<LoginShared> createState() => _LoginSharedState();
}

class _LoginSharedState extends State<LoginShared> {
  
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  late SharedPreferences preferences;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginShared"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: username,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "USERNAME",
            ),
          ),
          ),

          Padding(padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "PASSWORD",
              ),
            ),
          ),
          ElevatedButton(onPressed: () => LoginValidate() , child: Text("LOGIN")),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=> SharedRegister()));
          }, child: Text("REGISTRATION"))
        ],
      ),
    );
}


void LoginValidate() async{
  preferences = await SharedPreferences.getInstance()!;
  String storeduser = preferences.getString("username")!;
  String storedpassword = preferences.getString("password")!;
  String storedconfirmpassword = preferences.getString("password")!;

  String Username = username.text;
  String Password = password.text;
  String ConfirmPassword = confirmpassword.text;

  if(storeduser == username && storedpassword == password && storedconfirmpassword == confirmpassword){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeShared()));
  }else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text(" username or password incorrect")));
  }


}
}
