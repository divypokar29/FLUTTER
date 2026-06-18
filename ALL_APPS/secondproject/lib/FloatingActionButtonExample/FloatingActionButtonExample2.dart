import 'package:flutter/material.dart';

class MyFloatingExample2 extends StatefulWidget {
  const MyFloatingExample2({super.key});

  @override
  State<MyFloatingExample2> createState() => _MyFloatingExample2State();
}

class _MyFloatingExample2State extends State<MyFloatingExample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FLoating")),
      body: Column(
        children: [
          FloatingActionButton.small(onPressed: () {}, child: Icon(Icons.add)),

          FloatingActionButton.large(onPressed: () {}, child: Icon(Icons.add)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Home"),
        icon: Icon(Icons.home),
      ),
    );
  }
}
