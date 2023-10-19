import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Items'),
      ),
      body: const Center(
        child: Text(
          'This page will let the user add items',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
