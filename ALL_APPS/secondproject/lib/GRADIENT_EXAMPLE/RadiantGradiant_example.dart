import 'package:flutter/material.dart';

class RadiantgradiantExample extends StatelessWidget {
  const RadiantgradiantExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadiantGradiant"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        height: 160,
        width: 160,

        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.4,
            colors: [
              Colors.amberAccent,
              Colors.deepPurpleAccent,
              const Color.fromARGB(255, 51, 218, 32),
            ],
          ),
        ),
      ),
    );
  }
}
