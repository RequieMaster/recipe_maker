import 'package:flutter/material.dart';
import 'package:test27/login_screen.dart';
import 'package:test27/widget_tree.dart';
import 'package:firebase_database/firebase_database.dart';

import 'dart:async';

//import 'firebase_options.dart';
import 'firebase_options.dart';
import 'first_screen.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform/*).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository()*/);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Maker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage()
    );
  }
}

