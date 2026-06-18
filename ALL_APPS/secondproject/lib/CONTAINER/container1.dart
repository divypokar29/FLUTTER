import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        height: 160,
        width: 160,

        child: Center(child: Text("Welcom to flutter")),
        decoration: BoxDecoration(color: Colors.amber[200]),
      ),
    );
  }
}
