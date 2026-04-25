import 'package:flutter/material.dart';

void main() {
  runApp(Myappbar3());
}

class Myappbar3 extends StatelessWidget {
  const Myappbar3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}
