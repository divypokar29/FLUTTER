import 'package:flutter/material.dart';

class LineargradiantExample extends StatelessWidget {
  const LineargradiantExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LinearGradiant"),
        backgroundColor: Colors.deepPurpleAccent[200],
      ),
      body: Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          color:  Colors.blue,
        ),
      ),
    );
  }
}