import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main(){
  runApp(const MaterialApp(home: HomeGoogle(),
    debugShowCheckedModeBanner: false,));
}

class HomeGoogle extends StatefulWidget {
  const HomeGoogle({super.key});

  @override
  State<HomeGoogle> createState() => _HomeGoogleState();
}

final GoogleSignIn _googleSignIn =GoogleSignIn(scopes: ["email"]);

class _HomeGoogleState extends State<HomeGoogle> {
  GoogleSignInAccount? _currentuser;

  @override
  void initState(){
    _googleSignIn.onCurrentUserChanged.listen((account){
      setState(() {
        _currentuser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Google Sign in"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget(){
    GoogleSignInAccount? user = _currentuser;
    if(user != null){
      return Padding(
          padding: const EdgeInsets.fromLTRB(2, 12, 2, 12),
      child: Column(
        children: [
          ListTile(
            leading: GoogleUserCircleAvatar(identity: user),
            title: Text(user.displayName??'',
            style: const TextStyle(fontSize: 22),),
            subtitle: Text(user.email,style: const TextStyle(fontSize: 22)),),
          const SizedBox(height: 20,),
          const Text("Signed in Successfully",style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: signOut, child: const Text("Sign Out"))
        ],
      ),);
    } else{
      return Padding(padding:const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          const Text("You are not signed in",
          style: TextStyle(fontSize: 30),),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: signIn, child: const Padding(padding: EdgeInsets.all(8.0),
          child: Text("Sign in", style: TextStyle(fontSize: 30)),
          )),
        ],
      ),
      );
    }
  }


  void signOut() {
    _googleSignIn.disconnect();
  }

  Future<void> signIn() async{
    try{
      await _googleSignIn.signIn();
    } catch(e){
      print("Error Sign in $e");
    }
  }
}
