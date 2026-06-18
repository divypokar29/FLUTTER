import 'package:flutter/material.dart';

class Container2 extends StatelessWidget {
  const Container2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 134, 98, 141),
      appBar: AppBar(
        title: Text("CONTAINER!"),
        backgroundColor: const Color.fromARGB(255, 113, 81, 166),
      ),
      body: Container(
        height: 150,
        width: 150,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(100),
        decoration: BoxDecoration(
          color: Colors.purpleAccent,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.purple[300]),
          child: Center(child: Text("SHADE")),
        ),
      ),
    );
  }
}
