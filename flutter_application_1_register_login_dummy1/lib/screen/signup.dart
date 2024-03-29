

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';


// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }
// final nameController = TextEditingController();
// final addessController = TextEditingController();
// final emailController = TextEditingController();
// final passwordController = TextEditingController();
// final databaseReference = FirebaseDatabase.instance.ref("");
// // final databaseReference = Firebaseio.instance.ref("StoreData");

// class _SignupState extends State<Signup> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 180, 210, 234),
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         centerTitle: true,
//         title: const Text("Add informstion"),
//       ),
//       body: Column(children: [
//         const SizedBox(height: 25,),
//         commonTestField("Name",nameController,false),
//         commonTestField("address",addessController,false),
//         commonTestField("email",emailController,false),
//         commonTestField("password",passwordController,true),
//          const SizedBox(height: 25,),

//         ElevatedButton(onPressed: (){

//           // check if any of the text fields are empty
//           if(nameController.text.isEmpty||
//           addessController.text.isEmpty||
//           emailController.text.isEmpty||
//           passwordController.text.isEmpty){
//             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("please enter all fields",
//             ),
//             duration: Duration(seconds: 2),
//             ));
//             return; //do not proceed with adding data
//           }

//           // if(nameController.text.isEmpty){
//           //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("please enter all fields",
//           //   ),
//           //   duration: Duration(seconds: 2),
//           //   ));
//           //   return; //do not proceed with adding data
//           // }





//           databaseReference.child(
//             DateTime.now().microsecond.toString()).child("Details").set(
//               {
//             'name': nameController.text.toString(),
//             'addess': addessController.text.toString(),
//             'email': emailController.text.toString(),
//             ' password': passwordController.text.toString(),
//             'id': DateTime.now().microsecond.toString(),//every time id unique
//           });
//           //cear text controllers
//           nameController.clear();
//           addessController.clear();
//           emailController.clear();
//           passwordController.clear();
//           //for dismiss the keybord after addint items
//           FocusScope.of(context).unfocus();
//         },
//          child:const Text("Add"))
//       ]
//       ),
//     );
//   }

//   Padding commonTestField(hint,controller,hide) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//         child: TextFormField(
//           controller: controller,
//           obscureText: hide,  //password hide
//         decoration: InputDecoration(
//           hintText: hint,
//           focusedBorder: OutlineInputBorder(
//             borderRadius:BorderRadius.circular(20),
//             borderSide: const BorderSide(
//               color: Colors.green,
//               width: 3,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//         borderSide: const BorderSide(
//           color: Colors.black,
//           width: 1,
//         ),
//         ),
//         ),
//         ),
//       );
//   }
// }







































import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_register_login_dummy1/screen/wrapper.dart';
// import 'package:flutter_application_2_flutter_fly_email_password_authentication/screen/wrapper.dart';///
import 'package:get/get.dart';



class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

// final nameController = TextEditingController();

TextEditingController email= TextEditingController();
TextEditingController password= TextEditingController();
TextEditingController Name= TextEditingController();
final databaseReference = FirebaseDatabase.instance.ref("Store");

class _SignupState extends State<Signup> {

// TextEditingController email= TextEditingController();
// TextEditingController password= TextEditingController();

// signup()async{
//   await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
//   Get.offAll(Wrapper());
// }


signup() async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    Get.offAll(Wrapper());
  } catch (e) {
    // Handle the error here
    print('Error signing up: $e');
    // You can show a snackbar, toast, or any other UI to inform the user about the error.
  }
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text ("SignUp"),),
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

           TextField(
            controller: Name,
            decoration: InputDecoration(hintText: "Enter Name"),
          ),

      
  ElevatedButton(
  onPressed: () {
     if(email.text.isEmpty||
          password.text.isEmpty||
          Name.text.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("please enter all fields",
            ),
            duration: Duration(seconds: 2),
            ));
            return; //do not proceed with adding data
          }
    signup();
    databaseReference.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
      'email': email.text.toString(),
      'password': password.text.toString(),
      'Name': Name.text.toString(),
      'id': DateTime.now().microsecondsSinceEpoch.toString(),
    });
  },
  child: Text("Sign Up"),
)



           






          
        ],),
      )
    );
  }
}