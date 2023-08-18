import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: LoginSql(),debugShowCheckedModeBanner: false,));
}


class LoginSql extends StatelessWidget {
  const LoginSql({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginSql"),
      ),
      body:
         const Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                hintText: "Username",
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder()
                ),
              ),
            )
          ],
        ),

    );
  }
}
