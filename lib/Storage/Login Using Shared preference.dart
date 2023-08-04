import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Storage/SharedHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(const MaterialApp(
    home: LoginPageShared(),
  debugShowCheckedModeBanner: false,));
}
class LoginPageShared extends StatefulWidget {
  const LoginPageShared({super.key});

  @override
  State<LoginPageShared> createState() => _LoginPageSharedState();
}

class _LoginPageSharedState extends State<LoginPageShared> {

  final Username_Controller= TextEditingController();
  final Password_Controller= TextEditingController();

  late SharedPreferences preferences;// shared preference  instance

  late bool NewUser; // To  store value from shared preference

  @override
  void initState() {
    check_user_already_login();
    super.initState();
  }
  void check_user_already_login() async{
    preferences = await SharedPreferences.getInstance()!;
    ///firstcondition null execute second statement

    NewUser = preferences.getBool("NewUser")?? true;

    if(NewUser == false){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SharedHome()));
    }


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared pref Login"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
              padding:const EdgeInsets.all(20.0),
              child: TextField(
                controller: Username_Controller,
                decoration:const InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder()
                ),
              ),
            ),
             Padding(
              padding:const EdgeInsets.all(20.0),
              child: TextField(
                controller: Password_Controller,
                decoration:const InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder()
                ),
              ),
            ),

            ElevatedButton(onPressed: () async{
              preferences=await SharedPreferences.getInstance()!;
              String Username=Username_Controller.text;
              String Password=Password_Controller.text;

              if (Username !="" && Password!=""){
                preferences.setString("Username",Username);
                // if the user is logged in value of newuser will be false
                // if the user is logged out value of newuser will be true

                preferences.setBool("NewUser", false);

                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SharedHome()));
              }
            }, child: const Text("Login"))
          ],
        ),
      ),
    );
  }


}
