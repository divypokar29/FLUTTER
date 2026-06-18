import 'package:flutter/material.dart';
import 'package:secondproject/CustomWidgets/MyContainer.dart';

class MyMessenger extends StatefulWidget {
  const MyMessenger({super.key});

  @override
  State<MyMessenger> createState() => _MyMessengerState();
}

class _MyMessengerState extends State<MyMessenger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messenger")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("welcome to flutter"),
                  backgroundColor: Colors.teal,
                  elevation: 20,

                  action: SnackBarAction(label: "Ok", onPressed: () {}),
                ),
              );
            },
            child: Text("Click here"),
          ),
          Mycontainer(),
        ],
      ),
    );
  }
}
