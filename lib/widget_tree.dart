import 'package:flutter/material.dart';
import 'package:test27/firebase_auth.dart';
import 'package:test27/first_screen.dart';
import 'package:test27/login_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseConnect().onAuthStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FirstScreen();
        } else {
          return LoginPage();
        }
      },
    );
  }
}

