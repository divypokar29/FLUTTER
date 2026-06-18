import 'package:flutter/material.dart';

class myexample extends StatelessWidget {
  const myexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONTAINER EXAMPLE"),
        backgroundColor: Colors.teal,
      ),
      body: (Row(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.blue,
            child: Center(child: Text("CONTAINER EXAMPLE")),
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.green,
            child: Center(child: Text("CONTAINER EXAMPLE")),
          ),
        ],
      )),
    );
  }
}
