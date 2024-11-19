import 'package:flutter/material.dart';

void main() {
  runApp(const Flower_App());
}

class Flower_App extends StatelessWidget {
  const Flower_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flower App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flower App'),
          ),
          body: const Center(
            child: Text('Welcome to Flower App'),
          ),
        ));
  }
}
