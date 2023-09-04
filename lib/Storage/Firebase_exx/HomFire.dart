import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Storage/Firebase_exx/Firebase%20Helper.dart';
import 'package:flutter_project_may2023/Storage/Firebase_exx/firelogin.dart';

class HomeFire extends StatelessWidget {
  const HomeFire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          FireHelper().signOut().then((value) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>LoginFire()));
          });
        },
        child: Text("Sign Out"),),
      ),
    );
  }
}
