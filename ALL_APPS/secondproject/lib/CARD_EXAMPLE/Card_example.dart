import 'package:flutter/material.dart';

class Card_example extends StatelessWidget {
  const Card_example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Example"),
        backgroundColor: Colors.amber,
      ),
      body: Card(elevation: 10, child: Container(height: 300, width: 300)),
    );
  }
}
