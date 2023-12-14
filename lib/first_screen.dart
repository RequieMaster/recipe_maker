import 'package:flutter/material.dart';
import 'package:test27/second_screen.dart';
import 'package:test27/third_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var recipes = [
    const Recipe(
      name: 'Pizza Margherita',
      description: 'This is a description',
    ),
    const Recipe(
      name: 'Pizza Margherita 1',
      description: 'This is a description',
    ),
    const Recipe(
      name: 'Pizza Margherita 2',
      description: 'This is a description',
    ),
    const Recipe(
      name: 'Pizza Margherita 3',
      description: 'This is a description',
    ),
    const Recipe(
      name: 'Pizza Margherita 4',
      description: 'This is a description',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Maker'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdScreen(
                      onRecipeAdded: (recipe) {
                        if (recipe != null) {
                          setState(() {
                            recipes.add(recipe);
                          });
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondScreen(recipe: recipes[index]),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 18.0 / 11.0,
                              child: Image.asset('assets/images/pizza.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recipes[index].name,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    recipes[index].description,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
              // Expanded(
              //   child: GridView.builder(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       childAspectRatio: 1.0,
              //     ),
              //     itemCount: recipes.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Card(
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => SecondScreen(recipe: recipes[index]),
              //               ),
              //             );
              //           },
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               AspectRatio(
              //                 aspectRatio: 18.0 / 11.0,
              //                 child: Image.asset('assets/images/pizza.jpg'),
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(recipes[index].name),
              //                     SizedBox(height: 8.0),
              //                     Text(recipes[index].description),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ));
  }
}

class Recipe {
  final String name;
  final String description;

  const Recipe({required this.name, required this.description});
}
