import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_register_login_dummy1/screen/forgot.dart';
import 'package:flutter_application_1_register_login_dummy1/screen/signup.dart';
// import 'package:flutter_application_2_flutter_fly_email_password_authentication/screen/forgot.dart';///
// import 'package:flutter_application_2_flutter_fly_email_password_authentication/screen/homepage.dart';///
// import 'package:flutter_application_2_flutter_fly_email_password_authentication/screen/signup.dart';///
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController email= TextEditingController();
TextEditingController password= TextEditingController();

// signIn()async{
//   await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  
// }








signIn() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    // If sign-in is successful, you can navigate to the desired screen or perform other actions.
  } catch (e) {
    // Handle the error here

    print('Error signing in: $e');
    // You can show a snackbar, toast, or any other UI to inform the user about the error.
  }
}




class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text ("Login"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: email,
            decoration: InputDecoration(hintText: "EnterEmail"),
          ),

           TextField(
            controller: password,
            decoration: InputDecoration(hintText: "Enter password"),
          ),

          // ElevatedButton(onPressed: (()=>signIn()),child: Text("Login")),

           ElevatedButton(onPressed: (){ 
            if(email.text.isEmpty||
          password.text.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("please enter all fields",
            ),
            duration: Duration(seconds: 2),
            ));
            return; //do not proceed with adding data
          }
          signIn();
          },
          
          //  (()=>signIn()),
           child: Text("Login")),

          SizedBox(height: 30,),
          ElevatedButton(onPressed: (()=>Get.to(Signup())),child: Text("Register")),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (()=>Get.to(Forgot())),child: Text("Forgot password")),
          
        ],),
      )
    );
  }
}