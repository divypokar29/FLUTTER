import 'package:flutter/material.dart';

class MyScreen2 extends StatefulWidget {
  String message;
  MyScreen2({super.key, required this.message});

  @override
  State<MyScreen2> createState() => _MyScreen2State();
}

class _MyScreen2State extends State<MyScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Column(
        children: [
          Text("${widget.message}"),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back"),
          ),
        ],
      ),
    );
  }
}
