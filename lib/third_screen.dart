import 'package:flutter/material.dart';

import 'first_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.onRecipeAdded});

  final Function(Recipe? reciper) onRecipeAdded;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final TextEditingController _recipeNameController = TextEditingController();
  final TextEditingController _recipeDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: _recipeNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Recipe Name',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _recipeDescriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Recipe Description',
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  _saveRecipe();
                },
                child: const Text('Add Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _saveRecipe() {
    var name = _recipeNameController.text;
    var description = _recipeDescriptionController.text;
    if (name.isNotEmpty && description.isNotEmpty) {
      widget.onRecipeAdded(Recipe(name: name, description: description));
      Navigator.pop(context);
      // Navigator.pop(context, Recipe(name: name, description: description));
    }
  }
}
