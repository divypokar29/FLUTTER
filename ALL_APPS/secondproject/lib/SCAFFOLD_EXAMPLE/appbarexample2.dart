import 'package:flutter/material.dart';

class appbarexample2 extends StatelessWidget {
  const appbarexample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("instagram"),
        backgroundColor: const Color.fromARGB(255, 255, 68, 115),
        elevation: 20,
        leading: Icon(Icons.person),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
