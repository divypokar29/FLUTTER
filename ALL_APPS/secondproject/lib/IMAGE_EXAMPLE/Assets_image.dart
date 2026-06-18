import 'package:flutter/material.dart';

class Imageexample extends StatelessWidget {
  const Imageexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: Text("Image example"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Container(
              height: 250,
              width: 250,
              child: Image.asset("assest/image.png", fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
