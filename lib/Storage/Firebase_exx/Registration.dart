import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Storage/Firebase_exx/Firebase%20Helper.dart';
import 'package:flutter_project_may2023/Storage/Firebase_exx/firelogin.dart';

class FireRegistration extends StatefulWidget {
  const FireRegistration({super.key});

  @override
  State<FireRegistration> createState() => _FireRegistrationState();
}

class _FireRegistrationState extends State<FireRegistration> {
  final remail = TextEditingController();
  final rpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Registration Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: remail,
              decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email"
              ),
            ),
           const SizedBox(height: 20,),
            TextField(
              controller: rpass,
              decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password"
              ),
            ),
            const SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              String username = remail.text.trim();
              String password = rpass.text.trim();

              FireHelper().signUp(email : username, pwd: password).then((message){
               if( message ==  null){
                 Navigator.of(context).push(MaterialPageRoute(
                     builder: (context)=>LoginFire()));
               } else {
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content: Text(message)));
               }
              });

            },
                child: Text("Registere Here")),
            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}