import 'package:flutter/material.dart';

void main() {
  runApp(Textwidget1());
}

class Textwidget1 extends StatelessWidget {
  const Textwidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 32, 50),
      appBar: AppBar(
        centerTitle: true,
        title: Text("TEXT WIDGET", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          "Welcom to flutter",
          style: TextStyle(
            fontSize: 35,
            color: const Color.fromARGB(255, 113, 95, 142),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
