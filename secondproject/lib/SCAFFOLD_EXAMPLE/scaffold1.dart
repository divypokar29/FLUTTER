import 'package:flutter/material.dart';

void main() {
  runApp(scaffold1());
}

class scaffold1 extends StatelessWidget {
  const scaffold1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Wattsapp"),
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
