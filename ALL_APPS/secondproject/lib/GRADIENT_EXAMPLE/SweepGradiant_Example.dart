import 'package:flutter/material.dart';

class SweepgradiantExample extends StatelessWidget {
  const SweepgradiantExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SweepGradiant")),
      body: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          gradient: SweepGradient(
            // endAngle: 0.8,
            colors: [Colors.amber, Colors.deepPurple, Colors.green],
          ),
        ),
      ),
    );
  }
}
