import 'package:flutter/material.dart';


class HelloApp extends StatelessWidget {
  const HelloApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Hello App')),
        body: const Center(
          child: Text('Hello, Flutter!', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
