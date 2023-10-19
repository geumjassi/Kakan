import 'package:flutter/material.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Items Screen'),
      ),
      body: const Center(
        child: Text(
          'This page is for saved items',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
