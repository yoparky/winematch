import 'package:flutter/material.dart';
import 'package:winematch/screens/recipe_list_scaffold.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipes')),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: const Text('Vegetables'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: const Text('Roasted Vegetables'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('Soft Cheese'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('Hard Cheese'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: const Text('Starches'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: const Text('Fish'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[700],
              child: const Text('Rich Fish'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[800],
              child: const Text('White Meat'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: const Text('Red Meat'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: const Text('Cured Meat'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('Sweets'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeListRoute()));
            },
          ),
        ],
      ),
    );
  }
}
