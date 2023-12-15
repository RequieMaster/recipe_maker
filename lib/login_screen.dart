import 'package:flutter/material.dart';
import 'package:test27/firebase_auth.dart';
import 'package:test27/register_screen.dart';

import 'first_screen.dart';

import 'package:firebase_core/firebase_core.dart';
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}*/

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () async {
                    // Call the performVerification function to authenticate with Firebase
                    bool verificationResult = await performVerification();
                    if (verificationResult) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => FirstScreen()),
                      );
                    } else {
                      // Show a dialog or display a message to inform the user about verification failure
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Verification Failed'),
                            content: Text('Please check your credentials and try again.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Login',
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
                  MaterialPageRoute(builder: (_) => RegisterPage()), // Replace RegisterScreen with the actual name of your register screen class
                );
              },
              child: Text('New User? Create Account'),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> performVerification() async {
    try {
      // Use Firebase Authentication to sign in with email and password
      await FirebaseConnect().loginUser(email: emailController.text.trim(), password: passwordController.text.trim());
      

      // If the sign-in is successful, return true
      return true;
    } catch (e) {
      print("Error during verification: $e");
      // If the sign-in fails, return false
      return false;
    }
  }
}
