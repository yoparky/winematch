import 'package:flutter/material.dart';
import '../widgets/cellar_form.dart';

class FormRoute extends StatelessWidget {
  const FormRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Cellar Entry'),
      ),
      body: CellarForm()
    );
  }
}