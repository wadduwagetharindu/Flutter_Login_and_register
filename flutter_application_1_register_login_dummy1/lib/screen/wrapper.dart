import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_register_login_dummy1/screen/homepage.dart';
import 'package:flutter_application_1_register_login_dummy1/screen/loging.dart';
// import 'package:flutter_application_2_flutter_fly_email_password_authentication/screen/homepage.dart';///
// import 'package:flutter_application_2_flutter_fly_email_password_authentication/screen/loging.dart';///

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context,snapshot) { 
          if(snapshot.hasData){
            return Homepage();
          }else{
            return Login();
          }
          },
      ),
    );
  }
}