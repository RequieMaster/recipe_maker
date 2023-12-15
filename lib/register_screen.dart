// ignore_for_file: nullable_type_in_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test27/firebase_auth.dart';
import 'package:test27/login_screen.dart';

import 'first_screen.dart';
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}*/

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}



class _RegisterPageState extends State<RegisterPage> {


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registerUser() async{
    try{
      await FirebaseConnect().registerUser(
          email: emailController.text,
          password: passwordController.text
      );
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        print('The password provided is too weak.');
      } else if(e.code == 'email-already-in-use'){
        print('The account already exists for that email.');
      }
    } catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register Now"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextButton(
                  onPressed: () {
                    registerUser();
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => LoginPage()));
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            TextButton(
              onPressed: () {
                // Navigate to the register screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()), // Replace RegisterScreen with the actual name of your register screen class
                );
              },
              child: const Text('Owns an account? Log in.'),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> signUp(String email, String password) async {

    return false;
  }
}