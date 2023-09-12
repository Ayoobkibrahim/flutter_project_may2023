import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/Storage/Firebase_exx/Authentication/newmain.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(home: PhoneAuth(),debugShowCheckedModeBanner: false,));
}

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String userNumber = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  var otpFieldVisibility = false;
  var receivedID = '';

  void verifyUserPhoneNumber(){
    auth.verifyPhoneNumber(
        phoneNumber: userNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) async{
            if(value.user !=null){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context)=> HomeGoogle()), (route) => false);

            }
          });
        },
        verificationFailed: (FirebaseAuthException e ){
          print(e.message);
        }, codeSent: (String verificationId, int? resendToken){
          receivedID = verificationId;
          otpFieldVisibility =true;
    }, codeAutoRetrievalTimeout: (String verificationId){},
    );
  }
  Future<void> verifyOTPCode() async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedID,
        smsCode: otpController.text,
    );
    await auth.signInWithCredential(credential).then((value) async{
      if(value.user != null){
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context)=>HomeGoogle()),
                (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Phone Authentication",),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(10.0),
            child: IntlPhoneField(
              controller: phoneController,
              initialCountryCode: "NG",
              decoration: InputDecoration(
                hintText: "Phone Number",
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
              onChanged: (val){
                userNumber = val.completeNumber;

              },
            ),),
            Padding(padding: EdgeInsets.all(10.0),
            child: Visibility(child: TextField(
              controller: otpController,
              decoration: InputDecoration(
                hintText: "OTP Code",
                labelText: "OTP",
                border: OutlineInputBorder(),
              ),
            ),
            ),
            ),
            ElevatedButton(onPressed: (){
              if(otpFieldVisibility){
                verifyOTPCode();
              }else{
                verifyUserPhoneNumber();
              }
              FocusManager.instance.primaryFocus?.unfocus();

            }, child: Text(
              otpFieldVisibility ? "Login" : "Verify",
            ))
          ],
        ),
      ),
    );
  }
}
