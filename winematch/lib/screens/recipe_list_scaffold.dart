import 'package:flutter/material.dart';
import '../widgets/cellar_form.dart';

class RecipeListRoute extends StatelessWidget {
  const RecipeListRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe List'),
      ),
      body: Placeholder()
    );
  }
}