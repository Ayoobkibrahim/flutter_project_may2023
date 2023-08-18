import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Assignment/SQFLITE/SharedLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SharedRegister extends StatefulWidget {
  const SharedRegister({super.key});

  @override
  State<SharedRegister> createState() => _SharedRegisterState();
}

class _SharedRegisterState extends State<SharedRegister> {
   final name = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  late SharedPreferences preference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedRegistraion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "USERNAME"
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(15.0),
                child: TextField(
                  controller: password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "PASSWORD"),
                )
            ),
            Padding(padding: EdgeInsets.all(15.0),
                child: TextField(
                  controller: confirmpassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "CONFIRM PASSWORD"),
                )
            ),
            ElevatedButton(onPressed: ()=> LoginShared(),

                child: Text("REGISTER HER")),
          ],
        ),
      ),
    );
  }
  void storedata() async{
    String personname = name.text;
    String Username = username.text;
    String Password = password.text;
    String ConfirmPassword = confirmpassword.text;

    preference = await SharedPreferences.getInstance()!;
    preference.setString('name',personname);
    preference.setString('username',Username);
    preference.setString('password',Password);
    preference.setString('confirmpassword',ConfirmPassword);

  }
}
