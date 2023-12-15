import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'first_screen.dart';

class FirebaseConnect {
  final FirebaseFirestore _databaseReference = FirebaseFirestore.instance;

  Future<void> addRecipe(
      {required String name, required String description}) async {
    try {
      await _databaseReference.collection('recipe').add({
        'name': name,
        'description': description,
      });
    } catch (e) {
      print('Error adding recipe: $e');
      rethrow;
    }
  }

  Future<List<Recipe>> getRecipes() async {
    try {
      QuerySnapshot snapshot = await _databaseReference.collection('recipe').get();

      List<Recipe> recipes = snapshot.docs.map((QueryDocumentSnapshot query) {
        return Recipe(name: query['name'] ?? '', description: query['description'] ?? '');
      }).toList();
      return recipes;
    } catch (e) {
      // Handle exceptions as needed
      print("Error fetching recipes: $e");
      return []; // or throw an exception if appropriate
    }
  }
}
