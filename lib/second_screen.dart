import 'package:flutter/material.dart';

import 'first_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nombre de receta: ${widget.recipe.name}',
            ),
          ],
        ),
      ),
    );
  }
}
