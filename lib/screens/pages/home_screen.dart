import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OGTech Devs'),
      ),
      body: const Center(
        child: Text(
          'LOGGED',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
